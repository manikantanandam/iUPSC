//
//  TopicDetailsViewModel.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Foundation

class TopicDetailsViewModel: ObservableObject {
    
    @Published var topic: Topic
    @Published var questions: [Question] = []
    let topicServiceManager: TopicsServiceManager
    
    init(topic: Topic, topicServiceManager: TopicsServiceManager) {
        self.topic = topic
        self.topicServiceManager = topicServiceManager
    }
    
    @MainActor
    func viewAppeared() async {
        print("Refreshing view")
        do {
            let updatedTopic = try await topicServiceManager.fetchTopic(id: topic.id)
            self.questions = []
            self.questions = updatedTopic.questions
            objectWillChange.send()
        } catch {
            print("Error in fetching topic \(topic.id)")
        }
    }
}
