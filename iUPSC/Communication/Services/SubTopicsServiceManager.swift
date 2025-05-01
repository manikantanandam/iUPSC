//
//  SubTopicsServiceManager.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Combine
import Foundation

class SubTopicsServiceManager: ObservableObject {
    
    init(serviceManager: FirestoreServiceManager) {
        self.serviceManager = serviceManager
    }
    
    private let serviceManager: FirestoreServiceManager
    @Published public var subTopics: [SubTopic] = []
    
    // MARK: - Fetch Subjects (Read)
    @MainActor
    func fetchSubjects() async throws {
        let _subjects = try await serviceManager.readCollection(collection: .subTopics, modelType: SubTopic.self)
        subTopics = _subjects
    }
    
    // MARK: - Add a New Subject (Create)
    @MainActor
    func addSubject(name: String) async throws {
        let newSubject = SubTopic(name: name)
        _ = try await serviceManager.create(collection: .subTopics, documentID: newSubject.id, data: newSubject)
        subTopics.append(newSubject)
    }
    
    // MARK: - Update a Subject (Update)
    @MainActor
    func updateSubject(subject: SubTopic) async throws {
        _ = try await serviceManager.update(collection: .subTopics, documentID: subject.id, data: subject)
        subTopics.update(element: subject)
    }
    
    // MARK: - Delete a Subject (Delete)
    @MainActor
    func deleteSubject(subject: SubTopic) async throws {
        _ = try await serviceManager.delete(collection: .subTopics, documentID: subject.id)
        subTopics.remove(element: subject)
    }
}
