//
//  SubjectDetailsViewModel.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 29/04/25.
//

import Foundation

class SubjectDetailsViewModel: ObservableObject {
    public let subject: Subject
    let subjectServiceManager: SubjectServiceManager

    // Dependency injection via Swinject
    init(subject: Subject,
         subjectServiceManager: SubjectServiceManager) {
        self.subject = subject
        self.subjectServiceManager = subjectServiceManager
    }
    
    func deleteSubject() async {
        do {
            try await subjectServiceManager.deleteSubject(subject: subject)
        } catch {
            // Handle the error here
            print("Error deleting subject: \(error)")
        }
    }
}
