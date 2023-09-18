//This file is the one that manages the interface between the CoreML model, Vision and the AR Session. In summary, It defines some basic elements of the ARSession, has the function that starts the AR Session, and the one that stops it when the user leaves the screen.  It also captures frames that came from the session and uses vision to identify human hands in it. These frames are then turned into keyPointsMultiArrays to be analyzed by the model, so that it can identify which action is being executed. The model takes 90 frames at a time, something that I found to be necessary to improve accuracy, but that also creates some delay on the models response. I decided this trade-off was sorth it, because without it the results would'nt be accurate enough for the experience to make sense. Finally, some comments are distributed throughout the file to facilitate the understanding o fthe code.


import Foundation
import RealityKit
import ARKit
import Vision
import SwiftUI

class ARViewModel: UIViewController, ObservableObject, ARSessionDelegate {
    
    @Published private var model : ARModel = ARModel()
    @ObservedObject var settings =  VariableSettings.shared

    let signModel = try! BabyHandSignClassifier(configuration: MLModelConfiguration())

    var frameCount: Int = 0
    var queue = [MLMultiArray]() // queue of frames to be analyzed by the model
    var queueSamplingCount: Int = 10
    var queueSamplingCounter: Int = 0
    var queueSize: Int = 90 // maximum size of queue of frames
    
    var arView : ARView {
        model.arView
    }
    
    func startSessionDelegate() {
        model.arView.session.delegate = self
    }
    
    func getHands(frame: ARFrame) -> [MLMultiArray] {
        // Function to get hands from AR session
        // Returns an array of tuples containing hand pose (MLMultiArray) and chirality
        
        let pixelBuffer = frame.capturedImage
        
        let handPoseRequest = VNDetectHumanHandPoseRequest()
        handPoseRequest.maximumHandCount = 2
        handPoseRequest.revision = VNDetectHumanHandPoseRequestRevision1
        
        let request = VNDetectHumanBodyPoseRequest()
        
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        
        do {
            try handler.perform([handPoseRequest])
        } catch {
            assertionFailure("Human Pose Request Failed: \(error)")
        }
        
        if let handPoses = handPoseRequest.results,
           let handObservation = handPoses.first {
            
            guard let keypointsMultiArray = try? handObservation.keypointsMultiArray() else { fatalError() }
            
            return [keypointsMultiArray]
        }
        
        return []
        
    }

    
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        
        frameCount += 1
        
        if frameCount % 3 == 0 { // This division prevents the ARSession from lagging too much
            
            let hands: [MLMultiArray] = getHands(frame: frame)
            
            for pose in hands {
                
                //loop that forms the MLM ultiArraythat will go through the model
                
                queue.append(pose)
                queue = Array(queue.suffix(90))
                queueSamplingCounter += 1
                
                if queue.count == queueSize && queueSamplingCounter % queueSamplingCount == 0 {
                    let poses = MLMultiArray(concatenating: queue, axis: 0, dataType: .float32)
                    let prediction = try? signModel.prediction(poses: poses)
                    
                    guard let label = prediction?.label,
                          let confidence = prediction?.labelProbabilities[label] else {
                        continue
                    }
                    
                    if confidence > 0.7 {
                        settings.result = label
                    }
                            
                }
                
                
            }
        }
        
    }
    
    func endSession(){
        model.pauseSession()
    }
    
    func beginSession(){
        model.restartSession()
    }
}
