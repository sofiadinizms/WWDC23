//This file was made to create the result variable, that is first accessed on the ARViewModel file, where it receives the label of the prediction made by the ARModel. It then is used on the GameView file, where I check if the result is equivalent to the Hand Sign that the user is supposed to make. Finally, this alters the user's score.

import Foundation
import SwiftUI



class VariableSettings: ObservableObject {
    
    static let shared = VariableSettings()
    @Published var result = ""
    
    
    private init(){}
}


