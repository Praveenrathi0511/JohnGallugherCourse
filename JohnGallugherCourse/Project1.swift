//
//  Project1.swift
//  JohnGallugherCourse
//
//  Created by Praveen rathi on 27/09/1945 Saka.
//

import SwiftUI

struct Project1: View {
    @State private var messageString = ""
    var body: some View {
        VStack{
            Text(messageString)
                .font(.largeTitle.weight(.heavy))
                .foregroundStyle(.red)
                .padding()
            HStack{
                Button("Awesome") {
                    messageString = "You are Awesome!"
                }
                .buttonStyle(.borderedProminent)
                
                Button("Great") {
                    messageString = "You are Great!"
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    Project1()
}
