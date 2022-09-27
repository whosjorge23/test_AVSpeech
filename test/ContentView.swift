//
//  ContentView.swift
//  test
//
//  Created by Giorgio Giannotta on 03/09/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 0) {
            TextEditor(
//                    "Insert a text to speak",
                    text: $text
                )
            .padding(15);
            
            Button(action: {buttonPressed()}) {
                Text("Button")
            }
            .padding(10)
            .background(.blue.opacity(0.70))
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
    func buttonPressed(){
        let uttarence = AVSpeechUtterance(string: text)
        uttarence.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(uttarence)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
