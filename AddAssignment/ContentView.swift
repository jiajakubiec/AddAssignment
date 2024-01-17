//
//  ContentView.swift
//  AddAssignment
//
//  Created by Jia Jakubiec on 12/22/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showingAlert = false
    @Environment(\.modelContext) var context
    @Query var assignment: [Assignment]
    @State var enteredAssignment: String = ""
    var body: some View {
        Button("Add assignment") {
            showingAlert = true
        }
        .alert("Add assignment", isPresented: $showingAlert) {
            VStack {
                TextField ("Enter Assignment Name", text: $enteredAssignment)
                TextField ("Enter Assignment Type", text: $enteredAssignment)
                TextField ("Enter Class Name", text: $enteredAssignment)
            }
            Button("Add") {
                showingAlert = true
                let assignment = Assignment(name: enteredAssignment)
                context.insert(assignment)
                enteredAssignment = ""
            }
        }
    }
}

#Preview {
    ContentView()
}
