//
//  Project1.swift
//  JohnGallugherCourse
//
//  Created by Praveen rathi on 27/09/1945 Saka.
//

import SwiftUI
import AVFAudio

struct Project1: View {
    @State private var messageString = ""
    @State private var imageString = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer:AVAudioPlayer!
    @State private var soundIsOn = true
    var body: some View {
        VStack {
            
            Text(messageString)
                .font(.largeTitle.weight(.heavy))
                .foregroundStyle(.red)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .frame(height: 150)
                .frame(maxWidth:.infinity)
                .padding()
                .animation(.easeInOut(duration: 0.2), value: messageString)
            Image(imageString)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .padding()
                .animation(.spring, value: imageString)
            Spacer()
            
            HStack{
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) { _, _ in
                        if audioPlayer != nil && audioPlayer.isPlaying{
                            audioPlayer.stop()
                        }
                    }
                Spacer()
                Button("Show Message") {
                    let messageArray = ["You are Awesome!","You are Great!","You are fantastic!","You are Skilled!","You are Wonderful!","You are superb!"]
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messageArray.count - 1)
                    messageString = messageArray[lastMessageNumber]
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: 9)
                    imageString = "image\(lastImageNumber)"
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: 5)
                    if soundIsOn{
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .tint(.accentColor)
        }
        .padding()
        
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber:Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read the file \(soundName)")
            return
        }
        do{
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
}


#Preview {
    Project1()
}



//Image(systemName: "cloud.sun.rain.fill")
//    .resizable()
//    .scaledToFit()
//    .symbolRenderingMode(.multicolor)
//    .padding()
//    .background(Color(hue: 0.521, saturation: 0.299, brightness: 0.950))
//    .clipShape(RoundedRectangle(cornerRadius: 30))
//    .shadow(color: .gray.opacity(0.5), radius: 30,x:20,y:20)
//    .overlay(
//        RoundedRectangle(cornerRadius: 30)
//            .stroke(.teal,lineWidth: 1.0)
//    )
//    .padding()
