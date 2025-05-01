//
//  QuestionView.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import SwiftUI

struct QuestionView: View {
    
    let question: Question
    
    var body: some View {
        Text(question.question)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 50)
            .padding(.leading, 8)
            .background(.white)
            .foregroundStyle(.black)
            .cornerRadius(8)
    }
}
