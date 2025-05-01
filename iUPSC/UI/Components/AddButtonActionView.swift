//
//  AddButtonActionView.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import SwiftUI

struct AddButtonActionView: View {
    let tapped: ()->Void
    var body: some View {
        Button {
            tapped()
        } label: {
            Image(systemName: "plus")
        }
    }
}
