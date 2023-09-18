//This is a view that explains the dynamic of the AR Experience. There is a background, a navigation link and a text. It appears after selecting the wagons and before the GameView.

import SwiftUI

struct IntroductionView: View {
    
    var origin: Int
    
    var body: some View {
        GeometryReader{geo in
            ZStack{
                Image("IntroBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                
                VStack(spacing: 0){
                    Text("All on board! The train is about to leave for a learning journey! During this journey you'll learn four signs that are often used by babies: All done, More, Milk and Play. You'll have to execute each sign correctly 5 times, and then move on to the next. Just a reminder: you'll  need an iPad Pro, on Landscape mode, with the front camera on the left side, and a surface to support it. Are you ready?")
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.28)
                        .multilineTextAlignment(.center)
                        .font(.custom(.merriweatherRegular, size: 15))
                    
                    
                    NavigationLink(destination: GameView()){
                        Image("NextButton")
                    }.frame(width: geo.size.width * 0.1, height: geo.size.height * 0.03)
                    
                }.position(x: geo.size.width / 2.5, y: geo.size.height / 2.8)
                
                NavigationLink(destination: ContentView()){
                    Image("BackButton")
                }.frame(width: geo.size.width * 0.1, height: geo.size.height * 0.03)
                    .position(x: geo.size.width * 0.1, y: geo.size.height * 0.1)
            }
            .foregroundColor(Color(.black))
            .ignoresSafeArea(.all)
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(origin: 1)
    }
}
