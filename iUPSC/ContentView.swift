//
//  ContentView.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 27/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    let container = DependencyContainer.shared
    init() {}

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            EmptyView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .dashboard:
                        DashboardView(
                            viewModel: container.resolve(DashboardViewModel.self)!
                        )
                    case .subjects:
                        SubjectsView(
                            viewModel: container.resolve(SubjectViewModel.self)!
                        )
                    case .subjectDetails(let subject):
                        SubjectDetailsView(
                            viewModel: container.resolve(SubjectDetailsViewModel.self, argument: subject)!
                        )
                    case .topics:
                        TopicsView(
                            viewModel: container.resolve(TopicsViewModel.self)!
                        )
                    case .topicDetails(let topic):
                        TopicDetailsView(
                            viewModel: container.resolve(TopicDetailsViewModel.self, argument: topic)!
                        )
                    case .subTopics:
                        EmptyView()
                    case .subTopicDetails(let subTopic):
                        EmptyView()
                    case .addQuestion(let topic):
                        AddQuestionView(
                            viewModel: container.resolve(AddQuestionViewModel.self, argument: topic)!
                        )
                    }
                }
        }
        
    }
}

