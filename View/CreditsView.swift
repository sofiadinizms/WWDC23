//This file is responsible for the CreditsView, which is the view that can be accessed when you are on the Home (ContentView) and click on the credits button. This is a simple view with a sky background image and some Texts explaining where some elements of the project came from. On all the tests, the normal behavior for this view was that the title was centered on the top and each Text on the Vstack was centered inside of a cloud.

import SwiftUI

struct CreditsView: View {
    var body: some View {
        GeometryReader{geo in
            
            ZStack{
                Image("CabinBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                VStack{
                    Text("Project credits")
                        .position(x: geo.size.width * 0.5, y: geo.size.height * 0.13)
                        .font(.custom(.merriweatherBold, size: 40))
                    
                    HStack{
                        
                        Text("Font found in buttons \n Abril, by José Scaglione and Veronika Burian \n Accessed through an Adobe Fonts license signature")
                            .position(x: geo.size.width * 0.05, y:  geo.size.height * 0.05)
                            .frame(width:geo.size.width * 0.3)
                            .multilineTextAlignment(.center)
                        
                        
                        Text("Font used throuhout the project \n Merriweather, by Sorkin Type \n Accessed through Google Fonts")
                            .position(x: geo.size.width * 0.28, y:  geo.size.height * 0.07)
                            .frame(width:geo.size.width * 0.3)
                            .multilineTextAlignment(.center)
                        
                    }.font(.custom(.merriweatherRegular, size: 15))
                    
                    HStack{
                        
                        Text("Assets & Illustrations \n Made by Sofia Diniz (me) specifically for this project")
                            .position(x: geo.size.width * 0.05, y: geo.size.height * 0.07)
                            .frame(width:geo.size.width * 0.3)
                            .multilineTextAlignment(.center)
                        
                        Text("Sound effects \n Train, by Envato (license signature) \n Baby Laugh by Free Sounds Library")
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

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
