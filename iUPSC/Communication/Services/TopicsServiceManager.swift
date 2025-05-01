//
//  TopicsServiceManager.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Combine
import Foundation

class TopicsServiceManager: ObservableObject {
    
    init(serviceManager: FirestoreServiceManager) {
        self.serviceManager = serviceManager
    }
    
    private let serviceManager: FirestoreServiceManager
    @Published public var topics: [Topic] = []
    
    // MARK: - Fetch Topics (Read)
    @MainActor
    func fetchTopics() async throws {
        let _subjects = try await serviceManager.readCollection(collection: .topics, modelType: Topic.self)
        topics = _subjects
    }
    
    // MARK: - Add a New Topic (Create)
    @MainActor
    func addTopic(name: String) async throws {
        let newTopic = Topic(name: name)
        _ = try await serviceManager.create(collection: .topics, documentID: newTopic.id, data: newTopic)
        topics.append(newTopic)
    }
    
    // MARK: - Update a Topic (Update)
    @MainActor
    func updateTopic(subject: Topic) async throws {
        _ = try await serviceManager.update(collection: .topics, documentID: subject.id, data: subject)
        topics.update(element: subject)
    }
    
    // MARK: - Delete a Topic (Delete)
    @MainActor
    func deleteTopic(subject: Topic) async throws {
        _ = try await serviceManager.delete(collection: .topics, documentID: subject.id)
        topics.remove(element: subject)
    }
}
