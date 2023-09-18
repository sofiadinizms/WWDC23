//This view is responsible for the AR Experience of the app. Most of the screen is controlled by two variables: score and selectedSecs. Firstly, the score holds the amount of times a user has correctly executed a Sign. Every 5 increments, the sign to be done changes and so does the image that represents it on the screen. When the user reaches 20 (maxScore), the NavigationLink to the congratulations view is trigered. On the other hand, the selectedSecs variable takes the seconds that have gone by since the screen was accessed to define when the Image with the mold (that indicates how the user should be positioned) should be on the screen (first 10 seconds). Finally, the onAppear and onDisapear functions begin and end the ARSession, an addition made to prevent bugs.

import SwiftUI
import RealityKit
import ARKit

struct GameView : View {
    
    @ObservedObject var arViewModel : ARViewModel = ARViewModel()
    @ObservedObject var settings =  VariableSettings.shared
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var selectedSecs = 0
    
    
    var visionRequests = [VNRequest]()
    @State var score: Int = 0
    
    private let maxScore = 20.0
    
    
    var body: some View {
        
        GeometryReader{geo in
            
            ZStack{
                
                
                ARViewContainer(arViewModel: arViewModel)
                    .edgesIgnoringSafeArea(.all)
                
                if selectedSecs <= 10{
                    ZStack{
                        Image("PositionMark")
                        
                        Text("Place your iPad on any surface and position yourself whithin the mold")
                            .padding()
                            .background(.yellow)
                            .cornerRadius(50)
                            .position(x: geo.size.width * 0.5, y: geo.size.height * 0.2)
                            .frame(width: geo.size.width)
                            .font(.custom(.merriweatherRegular, size: 15))
                        
                    }
                }
                
                if selectedSecs > 12 && selectedSecs <= 16{
                    Text("Keep going!")
                        .padding()
                        .background(Color(red: 0.557, green: 0.761, blue: 0.557))
                        .cornerRadius(50)
                        .position(x: geo.size.width * 0.5, y: geo.size.height * 0.2)
                        .frame(width: geo.size.width)
                        .font(.custom(.merriweatherRegular, size: 20))
                    
                }
                
                if selectedSecs > 20 && score <= 4{
                    Text("Remeber to position yourself properly!")
                        .padding()
                        .background(Color(red: 0.557, green: 0.761, blue: 0.557))
                        .cornerRadius(50)
                        .position(x: geo.size.width * 0.5, y: geo.size.height * 0.2)
                        .frame(width: geo.size.width)
                        .font(.custom(.merriweatherRegular, size: 20))
                    
                }
                
                VStack{
                    
                    ProgressBarView(progress: Binding<Double>(get: { Double(self.score) / maxScore}, set: { _ in }))
                        .position(x:geo.size.width * 0.25, y: geo.size.height * 0.1)
                        .frame(width: geo.size.width * 0.5)
                        .onReceive(timer){_ in
                            self.selectedSecs += 1
                            
                            switch settings.result{
                                
                            case "All Done":
                                if score >= 0 && score < 5 { score += 1 }
                                
                            case "More":
                                if score >= 5 && score < 10 { score += 1 }
                            case "Milk":
                                if score >= 10 && score < 15 { score += 1 }
                                
                            case "Play":
                                if score >= 15 && score < 20 { score += 1 }
                                
                            default:
                                return
                            }
                            
                        }
                    if self.selectedSecs > 10 {
                        
                        if score >= 0 && score < 5{
                            Image("All Done Sign")
                                .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1)
                                .position(x: geo.size.width * 0.5, y: geo.size.height * 0.28)
                                .onAppear(){
                                    playSoundtrack(sound: "babyLaugh")
                                }
                        } else if score >= 5 && score < 10{
                            Image("More Sign")
                                .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1)
                                .position(x: geo.size.width * 0.5, y: geo.size.height * 0.28)
                                .onAppear(){
                                    playSoundtrack(sound: "babyLaugh")
                                }
                        } else if score >= 10 && score < 15{
                            Image("Milk Sign")
                                .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1)
                                .position(x: geo.size.width * 0.5, y: geo.size.height * 0.28)
                                .onAppear(){
                                    playSoundtrack(sound: "babyLaugh")
                                }
                        } else if score >= 15 && score < 20{
                            Image("Play Sign")
                                .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1)
                                .position(x: geo.size.width * 0.5, y: geo.size.height * 0.28)
                                .onAppear(){
                                    playSoundtrack(sound: "babyLaugh")
                                }
                        }
                    }
                    
                    
                    if score == 20{
                        
                        NavigationLink("", destination: CongratulationsView(), isActive: .constant(true))
                            .opacity(0)
                            .background(Color.clear)
                            .frame(width: 0, height: 0)
                        }
                        
                    }
                
                NavigationLink(destination: ContentView()){
                    Image("BackButton")
                }.frame(width: geo.size.width * 0.1, height: geo.size.height * 0.03)
                    .position(x: geo.size.width * 0.1, y: geo.size.height * 0.1)
                    
                    
                    
                }
                
            }
            
            .onDisappear(){
                arViewModel.endSession()
            }
            .onAppear(){
                arViewModel.beginSession()
            }
            .ignoresSafeArea(.all)
            .navigationBarBackButtonHidden(true)
            .foregroundColor(.black)
        }
        
}
    
    
    
    struct ARViewContainer: UIViewRepresentable {
        
        var arViewModel: ARViewModel
        @ObservedObject var settings =  VariableSettings.shared
        
        func makeUIView(context: Context) -> ARView {
            arViewModel.startSessionDelegate()
            return arViewModel.arView
        }
        
        
        func updateUIView(_ uiView: ARView, context: Context) {
            
        }
        
    }
    
    
    
#if DEBUG
    
    struct GameView_Previews : PreviewProvider {
        static var previews: some View {
            GameView()
        }
    }
#endif
