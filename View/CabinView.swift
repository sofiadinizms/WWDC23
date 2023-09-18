//This file is responsible for the CabinView, which is the view that can be accessed when you are on the Home (ContentView) and click on the Cabin of the train or after the Congratulations view, when you finish the AR Experience. This is a simple view with a sky background image and some Texts explaining how to teach Baby Sign Language to babies. On all the tests, the normal behavior for this view was that the title was centered on the top and each Text on the Vstack was centered inside of a cloud.
//
//


import SwiftUI

struct CabinView: View {
    var body: some View {
        GeometryReader{geo in
            
            ZStack{
                Image("CabinBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                VStack{
                    Text("How to teach Baby Sign Language")
                        .position(x: geo.size.width * 0.5, y: geo.size.height * 0.1)
                        .font(.custom(.merriweatherBold, size: 40))
                    
                    HStack{
                        
                        Text("Associate the sign with the action it means, just like when teaching words")
                            .position(x: geo.size.width * 0.05, y:  geo.size.height * 0.05)
                            .frame(width:geo.size.width * 0.3)
                            .multilineTextAlignment(.center)
                        
                        
                        Text("Begin early! Babies are prone to learning at any stage, but the earlier you begin, the easier it is")
                            .position(x: geo.size.width * 0.28, y:  geo.size.height * 0.07)
                            .frame(width:geo.size.width * 0.3)
                            .multilineTextAlignment(.center)
                        
                    }.font(.custom(.merriweatherRegular, size: 15))
                    
                    HStack{
                        
                        Text("Get everybody envolved! Talk to your friends and family about baby sign language and ask them to also use the signs when interacting with your baby")
                            .position(x: geo.size.width * 0.05, y: geo.size.height * 0.07)
                            .frame(width:geo.size.width * 0.3)
                            .multilineTextAlignment(.center)
                        
                        Text("Repeat, repeat, repeat! Repetition is a crucial part of learning how to comunicate and it helps babies to identify the meaning of that action!")
                            .position(x: geo.size.width * 0.23, y: geo.size.height * 0.17)
                            .frame(width:geo.size.width * 0.25)
                            .multilineTextAlignment(.center)
                        
                    }.font(.custom(.merriweatherRegular, size: 15))
                    
                    
                }
                
                NavigationLink(destination: ContentView()){
                    Image("BackButton")
                }.frame(width: geo.size.width * 0.1, height: geo.size.height * 0.03)
                    .position(x: geo.size.width * 0.1, y: geo.size.height * 0.1)
                            
            }.ignoresSafeArea(.all)
                .navigationBarBackButtonHidden(true)
                .foregroundColor(.black)
        }
    }
}

struct CabinView_Previews: PreviewProvider {
    static var previews: some View {
        CabinView()
    }
}
