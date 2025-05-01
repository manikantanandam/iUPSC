//
//  File.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 29/04/25.
//

import SwiftUI

struct CustomAlertView: View {
    @Binding var isPresented: Bool
    @Binding var inputText: String

    var body: some View {
        if isPresented {
            ZStack {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    Text("Enter Your Input")
                        .font(.headline)

                    TextField("Type something...", text: $inputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    HStack {
                        Button("Cancel") {
                            isPresented = false
                        }
                        .foregroundColor(.red)

                        Button("OK") {
                            print("User Input: \(inputText)")
                            isPresented = false
                        }
                        .foregroundColor(.blue)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10)
                .frame(maxWidth: 300)
            }
        }
    }
}
