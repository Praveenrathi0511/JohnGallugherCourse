//
//  Github Exercise.swift
//  JohnGallugherCourse
//
//  Created by Praveen rathi on 28/09/1945 Saka.
//

import SwiftUI

struct Github_Exercise: View {
    var body: some View {
        VStack {
            Image(systemName: "3.circle")
                .resizable()
                .scaledToFit()
            Text("Version 3.0")
                .font(.largeTitle.weight(.black))
        }
        .padding()
        .foregroundStyle(.blue)
    }
}

#Preview {
    Github_Exercise()
}
