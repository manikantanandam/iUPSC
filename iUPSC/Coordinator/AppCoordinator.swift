//
//  SubjectsCoordinator.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 29/04/25.
//

import SwiftUI

enum AppRoute: Hashable {
    case dashboard
    case subjects
    case subjectDetails(Subject)
    case topics
    case topicDetails(Topic)
    case subTopics
    case subTopicDetails(SubTopic)
    case addQuestion(Topic)
    case updateQuestion(Topic, Question)
    case questionDetails(Topic, Question)
}

class AppCoordinator: ObservableObject {
    // Tracks the current navigation path
    @Published var navigationPath: [AppRoute] = []
    
    init() {
        navigationPath = [.dashboard]
    }

    // Function to navigate to the details view
    func push(route: AppRoute) {
        navigationPath.append(route)
    }
    
    func pop() {
        _ = navigationPath.removeLast()
    }

    // Function to reset navigation (e.g., returning to the main list)
    func resetNavigation() {
        navigationPath = []
    }
}
