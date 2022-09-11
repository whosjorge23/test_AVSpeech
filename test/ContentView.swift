//
//  ContentView.swift
//  test
//
//  Created by Giorgio Giannotta on 03/09/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 0) {
            Text("Hello, world!")
                .padding();
            Button(action: {print("Button Pressed")}) {
                Text("Button")
            }
        }
    }
    func buttonPressed(){
        let uttarence = AVSpeechUtterance(string: "Hello World")
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
