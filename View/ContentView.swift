//The ContentView is the home of the App, and contains a background with grass, hills and some clouds, a scrollable and clickable train, a smoke balloon with instructions and a navigation link to the credits view.

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        GeometryReader{geo in
            
            ZStack{
                ZStack{
                    
                    Image("HomeBackground")
                        .resizable()
                        
                        .scaledToFill()
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 0){
                            
                            NavigationLink(destination: IntroductionView(origin: 0)){
                                Image("Wagons")
                                    .resizable()
                                    .scaledToFill()
                            }
                            ZStack{
                                NavigationLink(destination: CabinView()){
                                    Image("Cabin")
                                        .resizable()
                                        .scaledToFill()
                                }
                                
                                Text("Click on the wagons to learn the signs, \n click on the cabin to learn how to teach them")
                                    .position(x: geo.size.width * 0.11,y: geo.size.height * 0.13)
                                    .frame(width: geo.size.width * 0.2)
                                    .multilineTextAlignment(.center)
                                
                            }
                            
                        }
                    }.position(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.37)
                        .frame(height: UIScreen.main.bounds.height * 0.6)
                    
                    NavigationLink(destination: CreditsView()){
                        Image("CreditsButton")
                    }.position(x: geo.size.width * 0.9, y: geo.size.height * 0.1)
                }
                
            }
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea(.all)
            .font(.custom(.merriweatherRegular, size: 15))
            .onAppear(){
                playSoundtrack(sound: "Train")
            }
            .foregroundColor(.black)
        }
        
        
    }
}

