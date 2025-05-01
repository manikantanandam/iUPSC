//
//  SubjectViewModel.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 27/04/25.
//


import Combine

class SubjectViewModel: ObservableObject {
    @Published var subjects: [Subject] = []
    let subjectServiceManager: SubjectServiceManager

    // Dependency injection via Swinject
    init(subjectServiceManager: SubjectServiceManager) {
        self.subjectServiceManager = subjectServiceManager
        
        subjectServiceManager.$subjects
            .assign(to: &$subjects)
    }
    
    func viewAppeared() async {
        do {
            try await subjectServiceManager.fetchSubjects()
        } catch {
            print("Unable to fetch the subjects \(error)")
        }
    }
    
    func addSubject(name: String) async {
        do {
            try await subjectServiceManager.addSubject(name: name)
        } catch {
            print("Unable to fetch the subjects \(error)")
        }
    }
}
