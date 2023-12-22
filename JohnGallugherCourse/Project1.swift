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
            
            Image(imageString)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .padding()
            
            Spacer()
            
            Button("Awesome") {
                let messageArray = ["You are Awesome!","You are Great!","You are fantastic!","You are Skilled!","You are Wonderful!","You are superb!"]
                
                var messageNumber:Int
                repeat {
                    messageNumber = Int.random(in: 0...messageArray.count - 1)
                } while messageNumber == lastMessageNumber
                lastMessageNumber = messageNumber
                
                var imageNumber:Int
                repeat {
                    imageNumber = Int.random(in: 0...9)
                } while imageNumber == lastImageNumber
                lastImageNumber = imageNumber
                
                messageString = messageArray[messageNumber]
                imageString = "image\(imageNumber)"
                
                var soundNumber:Int
                repeat {
                    soundNumber = Int.random(in: 0...5)
                } while soundNumber == lastSoundNumber
                lastSoundNumber = soundNumber
                
                let soundName = "sound\(soundNumber)"
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
            .buttonStyle(.borderedProminent)
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
