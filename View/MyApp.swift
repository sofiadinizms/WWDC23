//This project was designed to be a tool to teach parents the basics of Baby sign language. This topic is something that deeply interests me, as some of my earliest childhood memories involve the feeling of not being understood by grownups, something that Baby Sign Language attempts to resolve by improving the child's linguistic abilities.
// The entire interface was completely designed and illustrated by me and it was the first time I tried to illustrate something of this magnitude. I was inspired by my childhood drawings and books to try to capture an aura of childhood, while also making it practical for the parent to use.
// The coding process was a very big personal challenge for me. This was my first time working with SwiftUI all by myself, my first time working with playgrounds, and also my first time diving into the worlds of Vision, CoreML, and ARKit. It is not an exaggeration to say I jumped up and down with excitement when I finally managed to make the camera appear on the screen of the iPad. As mentioned before, this code was made using a mixture of SwiftUI, ARKit, Vision, CoreML, hard work, sleepless nights, and love. I hope you enjoy :)



import SwiftUI

@main
struct MyApp: App {
    
    init(){
        CustomFonts.register()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                OnboardingView()
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
