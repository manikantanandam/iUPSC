//
//  TopicDetailsView.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import SwiftUI

struct TopicDetailsView: View {
    
    @ObservedObject var viewModel: TopicDetailsViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    init(viewModel: TopicDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.topic.name)
                .font(.title)
                .padding(.vertical, 16)
            ForEach(0..<viewModel.questions.count, id: \.self) { index in
                let question = viewModel.questions[index]
                QuestionView(question: question)
                    .onTapGesture {
                        coordinator.push(route: .questionDetails(viewModel.topic, question))
                    }
            }
            Spacer()
        }
        .onAppear {
            Task {
                await viewModel.viewAppeared()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                AddButtonActionView {
                    coordinator.push(route: .addQuestion(viewModel.topic))
                }
            }
        }
    }
}
