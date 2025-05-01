//
//  SubjectServiceManager.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Combine
import Foundation

class SubjectServiceManager: ObservableObject {
    
    init(serviceManager: FirestoreServiceManager) {
        self.serviceManager = serviceManager
    }
    
    private let serviceManager: FirestoreServiceManager
    @Published public var subjects: [Subject] = []
    
    // MARK: - Fetch Subjects (Read)
    @MainActor
    func fetchSubjects() async throws {
        let _subjects = try await serviceManager.readCollection(collection: .subjects, modelType: Subject.self)
        subjects = _subjects
    }
    
    // MARK: - Add a New Subject (Create)
    @MainActor
    func addSubject(name: String) async throws {
        let newSubject = Subject(name: name)
        _ = try await serviceManager.create(collection: .subjects, documentID: newSubject.id, data: newSubject)
        subjects.append(newSubject)
    }
    
    // MARK: - Update a Subject (Update)
    @MainActor
    func updateSubject(subject: Subject) async throws {
        _ = try await serviceManager.update(collection: .subjects, documentID: subject.id, data: subject)
        subjects.update(element: subject)
    }
    
    // MARK: - Delete a Subject (Delete)
    @MainActor
    func deleteSubject(subject: Subject) async throws {
        _ = try await serviceManager.delete(collection: .subjects, documentID: subject.id)
        subjects.remove(element: subject)
    }
}
