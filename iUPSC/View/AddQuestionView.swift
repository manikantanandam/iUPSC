//
//  AddQuestionView.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import SwiftUI

struct AddQuestionView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject var viewModel: AddQuestionViewModel
    
    @State var question: String = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Question")
                    .frame(height: 60)
                CustomTextEditor(text: $viewModel.question.question)
                    .frame(height: 120)
                HStack {
                    Text("Answers - \(viewModel.question.answers.count)")
                        .frame(height: 60)
                    Spacer()
                    AddButtonActionView {
                        print("Add button tapped")
                        viewModel.addAnswerButtonTapped()
                    }
                }
                ForEach(viewModel.question.answers, id: \.id) { answer in
                    CustomTextEditor(text: Binding(
                        get: { answer.answer },
                        set: { newValue in
                            if let index = viewModel.question.answers.firstIndex(where: { $0.id == answer.id }) {
                                viewModel.question.answers[index].answer = newValue
                            }
                        }
                    ))
                    .frame(height: 120)
                }
                Spacer()
                SaveButtonView {
                    Task {
                        await viewModel.save()
                        coordinator.pop()
                    }
                }
                .padding(.vertical, 8)
            }
            .padding()
        }
    }
}
