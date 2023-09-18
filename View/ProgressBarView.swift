//This file is dedicated to the creation of the progress bar used in the GameView. The mechanic of the progress bar is essentialy this: there are two rectangles, one overlaying the other. The first rectangle defines the "bounds" of the progress bar, as in, it is the one that visually we actually recognize as the progress  bar. The second one works as the "filling" of the bar, and has its width extended everytime the user scores a point (the width is a division between the amount of points already scored and the maximum score possible)
//
//  
//
//
//
import SwiftUI

struct ProgressBarView: View {
    @Binding var progress: Double
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .foregroundColor(Color(UIColor(red: 0.96, green: 0.98, blue: 0.99, alpha: 1.0)))
                    .cornerRadius(50)
                
                Rectangle()
                    .foregroundColor(Color(UIColor(red: 0.0, green: 0.588, blue: 0.682, alpha: 1.0)))
                    .frame(width: geometry.size.width * CGFloat(self.progress), alignment: .leading)
                    .animation(.easeIn, value: progress)
                
            }.cornerRadius(50)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color(UIColor(red: 0, green: 0.42, blue: 0.59, alpha: 1.0)), lineWidth: 5)                 )
        }
        .frame(width: 500, height: 40)
    }
}
