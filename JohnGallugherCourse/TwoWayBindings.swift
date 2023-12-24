//
//  TwoWayBindings.swift
//  JohnGallugherCourse
//
//  Created by Praveen rathi on 02/10/1945 Saka.
//

import SwiftUI

struct TwoWayBindings: View {
    @State private var pressCount = 0
    @State private var toggleIsOn = true
    @State private var name = ""
    @State private var selectedColor:Color = .blue
    @State private var selectedDate:Date = .now
    @State private var steppValue = 1
    var body: some View {
        VStack{
            Spacer()
            Text("Press Count: \(pressCount)")
            Button("Press Me") {
                pressCount += 1
            }
            Spacer()
            TextField("Enter a name", text: $name)
                .textFieldStyle(.roundedBorder)
            Text("Name entered: \(name)")
            Spacer()
            .buttonStyle(.borderedProminent)
            Toggle("Toggle is \(toggleIsOn ? "On" : "Off")", isOn: $toggleIsOn)
            RoundedRectangle(cornerRadius: 15.0)
                .fill(selectedColor)
                .frame(width: 100, height: 100)
            ColorPicker("Pick a rectangle color: ", selection: $selectedColor)
            Spacer()
            DatePicker("Date:", selection: $selectedDate)
            Text("Selected Date is: \(selectedDate.formatted(date: .abbreviated, time: .shortened))")
            Spacer()
            Stepper("Stepper value: \(steppValue)", value: $steppValue,in:1...10)
            Spacer()
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    TwoWayBindings()
}
