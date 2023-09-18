import Foundation
import RealityKit
import ARKit
import SwiftUI

struct ARModel {
    private(set) var arView : ARView
    
    var handTilt: Float = 0
    @ObservedObject var settings =  VariableSettings.shared
    
    init() {
        
        arView = ARView(frame: .zero)
        arView.session.run(ARFaceTrackingConfiguration())
        
    }
    
    func pauseSession(){
        for anchor in arView.scene.anchors {
            arView.scene.removeAnchor(anchor)
        }
        
        arView.session.pause()
        arView.removeFromSuperview()
        
    }
    
    func restartSession(){
        arView.session.run(ARFaceTrackingConfiguration())
    }
    
}

