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
            Image(systemName: "1.circle")
                .resizable()
                .scaledToFit()
            Text("Version 1.0")
                .font(.largeTitle.weight(.black))
        }
        .padding()
        .foregroundStyle(.red)
    }
}

#Preview {
    Github_Exercise()
}
