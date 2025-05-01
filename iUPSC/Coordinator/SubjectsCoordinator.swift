//
//  SubjectsCoordinator.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 29/04/25.
//

import SwiftUI

class SubjectsCoordinator: ObservableObject {
    // Tracks the current navigation path
    @Published var navigationPath: [Subject] = []

    // Function to navigate to the details view
    func navigateToSubjectDetails(subject: Subject) {
        navigationPath.append(subject)
    }

    // Function to reset navigation (e.g., returning to the main list)
    func resetNavigation() {
        navigationPath = []
    }
}
