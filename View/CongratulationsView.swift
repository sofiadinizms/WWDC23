//This view is accessed directly after completing the AR Experience and is a view dedicated to congratulating the user on completing the exercises. It leads to the Cabin view. In all the tests, the normal behavior for this view was that there was a background with grass, hills and a sun. In the middle of the grass theres a title, a text and a Navigation Link that leads to the Cabin View.

import SwiftUI

struct CongratulationsView: View {
    
    
    var body: some View {
        GeometryReader{geo in
            
            ZStack{
                Image("CongratsBackground")
                    .resizable()
                    .scaledToFill()
                
                VStack{
                    Text("Congratulations!")
                        .font(.custom(.merriweatherBold, size: 30))
                    Text("You just learned the signs for the words All Done, More, Milk and Play. Although they are few, these signs are enough to make the lives of most babies and parents more tranquil. Now, follow along if you would like to know some tips on how to teach them to a child")
                        .font(.custom(.merriweatherRegular, size: 15))
                        .multilineTextAlignment(.center)
                        .padding()
                    NavigationLink(destination: CabinView()){
                        Image("NextButton")
                    }
                }.frame(width: geo.size.width * 0.5, height: geo.size.height * 0.3)
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.85)
                
            }.ignoresSafeArea(.all)
                .navigationBarBackButtonHidden(true)
                .foregroundColor(.black)
            
        }

    }
}

struct CongratulationsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationsView()
    }
}
