//
//  UpdateButtonView.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import SwiftUI

struct SaveButtonView: View {
    let tapped: ()->Void
    var body: some View {
        Button {
            tapped()
        } label: {
            Text("Save")
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(.blue)
                .foregroundStyle(.white)
                .cornerRadius(8)

        }

    }
}
