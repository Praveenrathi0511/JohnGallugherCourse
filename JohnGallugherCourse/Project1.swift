//
//  Project1.swift
//  JohnGallugherCourse
//
//  Created by Praveen rathi on 27/09/1945 Saka.
//

import SwiftUI

struct Project1: View {
    @State private var messageString = "Namaste"
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "figure.mind.and.body")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.pink)
            Text(messageString)
                .font(.largeTitle.weight(.heavy))
                .foregroundStyle(.red)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .frame(height: 150)
                .frame(maxWidth:.infinity)
                .padding()
            Spacer()
            HStack{
                Button("Awesome") {
                    messageString = "You are Awesome!"
                }
                .buttonStyle(.borderedProminent)
                Spacer()
                Button("Great") {
                    messageString = "You are Great!"
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    Project1()
}
