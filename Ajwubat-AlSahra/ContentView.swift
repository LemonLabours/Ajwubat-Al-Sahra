//
//  ContentView.swift
//  Ajwubat-AlSahra
//
//  Created by Lama AL Yousef on 19/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["nona", "Loli", "toto"]
    @State private var selectedStudent = "nona"

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Hello, \(name)")
                }

                ForEach(0..<3) {
                    Text("Row \($0)")
                }

                Button("Tap Count \(tapCount)") {
                    tapCount += 1
                }

                Section {
                    Picker("Select a Student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("SwiftUi")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

