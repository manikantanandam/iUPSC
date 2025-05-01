//
//  AddButtonView.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import SwiftUI

struct AddButtonBindingView: View {
    @Binding var tapped: Bool
    var body: some View {
        Button {
            tapped = true
        } label: {
            Image(systemName: "plus")
        }

    }
}
