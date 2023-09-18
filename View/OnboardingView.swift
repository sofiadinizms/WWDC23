//This view is a three-time repetition of a sky background with some text that help give context to this project. On the tests, the normal behaviour for the text and the button at the end of it was for them to be centered inside the main cloud of each view.

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        GeometryReader{geo in
            
            ScrollView{
                VStack(spacing: 0){
                    ZStack{
                        Image("OnboardingBackground")
                            .resizable()
                            .scaledToFill()
                        Text("To fully experience this project, make sure that you're using an iPad Pro in Landscape mode, with the front camera on the left border, and that you have a surface to support it :) \n \n When you're ready, scroll down to begin")
                            .frame(width: geo.size.width * 0.6, height: geo.size.height * 0.35)
                            .position(x: geo.size.width * 0.5, y: geo.size.width * 0.42)
                            .multilineTextAlignment(.center)
                            .font(.custom(.merriweatherRegular, size: 20))
                    }
                    ZStack{
                        Image("OnboardingBackground")
                            .resizable()
                            .scaledToFill()
                            .frame(minHeight: 834)
                        Text("In the 19th century, Yale professor William Whitney noticed the children from deaf families could communicate much earlier than other babies, and that knowing sign language also helped them when it came time to learn how to speak. This inspired the professor to create a simplified version of sign language that all babies could use: Baby Sign Language!")
                            .frame(width: geo.size.width * 0.6, height: geo.size.height * 0.3)
                            .position(x: geo.size.width * 0.5, y: geo.size.width * 0.42)
                            .multilineTextAlignment(.center)
                    }
                    ZStack{
                        Image("OnboardingBackground")
                            .resizable()
                            .scaledToFill()
                            .frame(minHeight: 834)
                        
                        Text("Studies on the communication of babies through signs continued, and in the 1980s two professors from the University of California found that some advantages of Baby Sign Language are a less frustrated baby, a closer bond with the parents, and a larger speaking vocabulary. So, let's learn some signs?")
                            .frame(width: geo.size.width * 0.6, height: geo.size.height * 0.3)
                            .position(x: geo.size.width * 0.5, y: geo.size.width * 0.42)
                            .multilineTextAlignment(.center)
                        
                        NavigationLink(destination: ContentView()){
                            Image("NextButton")
                        }.position(x: geo.size.width * 0.5, y: geo.size.width * 0.33)
                    }                }
            }.ignoresSafeArea(.all)
                .font(.custom(.merriweatherRegular, size: 20))
                .foregroundColor(.black)
            
               
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
