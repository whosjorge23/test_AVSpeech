//
//  ContentView.swift
//  test
//
//  Created by Giorgio Giannotta on 03/09/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var text: String = "Enter your text"
    @State private var selectedLanguage = "en-US"
    @State private var language = ""
    
    var languages = ["English US", "English GB", "English ZA","Italian IT", "Spanish ES", "French FR"]
    
    init() {
            UITextView.appearance().backgroundColor = .clear
        }

    
    var body: some View {
        ZStack {
            
            AsyncImage(url: URL(string: "https://i.imgur.com/QckYg92.jpg")) { image in
                image.resizable()
            } placeholder: {
                Color.indigo
            }
            .frame(width: .infinity, height: .infinity)
            
            VStack(alignment: HorizontalAlignment.center, spacing: 0) {
                TextEditor(
                    text: $text
                    )
                .background(Color.clear)
                .frame(height:UIScreen.main.bounds.size.height / 1.5, alignment: .center)
                .cornerRadius(25)
                .border(Color.indigo.opacity(0.70), width: 3)
                .lineSpacing(10)
                .disableAutocorrection(true)
                .padding(12)
                
                HStack(alignment: VerticalAlignment.center, spacing: 0) {
                    Picker("Please choose a language", selection: $selectedLanguage) {
                        ForEach(languages, id: \.self) {
                            Text($0)
                        }
                    }
                    .accentColor(Color.indigo)
                    Spacer().frame(width: 200)
                    Button(action: {buttonPressed()}) {
                        Text("Button")
                    }
                    .padding(10)
                    .background(.indigo.opacity(0.70))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
                
                Spacer().frame(height: 50)
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func buttonPressed(){
        switch selectedLanguage {
        case "Italian IT":
            language = "it-IT"
        case "English US":
            language = "en-US"
        case "English GB":
            language = "en-GB"
        case "English ZA":
            language = "en-ZA"
        case "Spanish ES":
            language = "es-ES"
        case "French FR":
            language = "fr-FR"
        default:
            language = "en-US"
        }
        let uttarence = AVSpeechUtterance(string: text)
        uttarence.voice = AVSpeechSynthesisVoice(language: language)
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
