//
//  DashboardViewModel.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 29/04/25.
//

import Foundation
import Combine

class DashboardViewModel: ObservableObject {
    @Published var items: [DashboardItem] = []
    
    let subjectServiceManager: SubjectServiceManager
    let topicsServiceManager: TopicsServiceManager
    
    var cancellables = Set<AnyCancellable>()
    
    init(subjectServiceManager: SubjectServiceManager,
         topicsServiceManager: TopicsServiceManager) {
        self.items = [
            .init(type: .subjects, count: 0),
            .init(type: .topics, count: 0)
        ]
        self.subjectServiceManager = subjectServiceManager
        self.topicsServiceManager = topicsServiceManager
        
        handleEvents()
    }
    
    func handleEvents() {
        subjectServiceManager.$subjects.sink { [weak self] subjects in
            self?.updateCount(for: .subjects, as: subjects.count)
        }
        .store(in: &cancellables)
        
        topicsServiceManager.$topics.sink { [weak self] topics in
            self?.updateCount(for: .topics, as: topics.count)
        }
        .store(in: &cancellables)    }
    
    func updateCount(for item: DashboardItemType, as count: Int) {
        guard
            let index = self.items.firstIndex(where: { $0.type == item })
        else { return }

        self.items[index].count = count
    }
    
    func viewAppeared() async {
        do {
            try await subjectServiceManager.fetchSubjects()
            try await topicsServiceManager.fetchTopics()
        } catch {
            print("Error in fetching the data")
        }
    }
}
