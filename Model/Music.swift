import Foundation
import AVFoundation

var soundEffect: AVAudioPlayer!

func playSoundtrack(sound: String) {
    let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        
        soundEffect = try AVAudioPlayer(contentsOf: url!)
        soundEffect?.setVolume(0.3, fadeDuration: 0.1)
        soundEffect?.play()
        
    } catch {
        print("")
    }
    
    
}

func stopSoundtrack(sound: String) {
    let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        
        soundEffect = try AVAudioPlayer(contentsOf: url!)
        soundEffect?.setVolume(0.3, fadeDuration: 0.1)
        soundEffect?.stop()
        
    } catch {
        print("")
    }
    
    
}


