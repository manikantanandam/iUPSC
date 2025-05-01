//
//  SubjectViewModel.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 27/04/25.
//


import Combine

class TopicsViewModel: ObservableObject {
    @Published var topics: [Topic] = []
    let topicsServiceManager: TopicsServiceManager

    // Dependency injection via Swinject
    init(topicsServiceManager: TopicsServiceManager) {
        self.topicsServiceManager = topicsServiceManager
        
        topicsServiceManager.$topics
            .assign(to: &$topics)
    }
    
    func viewAppeared() async {
        do {
            try await topicsServiceManager.fetchTopics()
        } catch {
            print("Unable to fetch the subjects \(error)")
        }
    }
    
    func addTopic(name: String) async {
        do {
            try await topicsServiceManager.addTopic(name: name)
        } catch {
            print("Unable to fetch the subjects \(error)")
        }
    }
}
