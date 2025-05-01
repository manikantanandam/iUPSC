//
//  SubTopic.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Foundation

struct SubTopic: DictionaryConvertible, Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let createdOn: TimeInterval
    let updatedOn: TimeInterval
    let topicIDs: [String]
    let subjectIDs: [String]
    let examIDs: [String]

    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.createdOn = Date().timeIntervalSince1970
        self.updatedOn = Date().timeIntervalSince1970
        self.topicIDs = []
        self.subjectIDs = []
        self.examIDs = []
    }
    
    // MARK: - Hashable Conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // MARK: - Equatable Conformance
    static func == (lhs: SubTopic, rhs: SubTopic) -> Bool {
        return lhs.id == rhs.id
    }
}
