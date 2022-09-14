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
            TextField(
                    "Isert a text to speak",
                    text: $text
                )
                .padding();
            Button(action: {buttonPressed()}) {
                Text("Button")
            }
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
