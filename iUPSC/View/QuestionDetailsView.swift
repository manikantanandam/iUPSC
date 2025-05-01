//
//  QuestionDetailsView.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import SwiftUI

struct QuestionDetailsView: View {
    @ObservedObject var viewModel: QuestionDetailsViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(viewModel.question.question)
                    .font(.title2)
                    .padding(.vertical, 16)
                ForEach(0..<viewModel.question.answers.count, id: \.self) { index in
                    let answer = viewModel.question.answers[index]

                    HStack(alignment: .top) {
                        if viewModel.question.answers.count > 1 {
                            Text("\(answer.serialNumber).")
                                .frame(width: 15)
                        }
                        
                        Text("\(answer.answer)")
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        coordinator.push(route: .updateQuestion(viewModel.topic, viewModel.question))
                    } label: {
                        Image(systemName: "pencil")
                    }

                }
            }
        }
    }
}
