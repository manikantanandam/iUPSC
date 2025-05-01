//
//  Topic.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Foundation

class Topic: DictionaryConvertible, Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let createdOn: TimeInterval
    let updatedOn: TimeInterval
    let subjectIDs: [String]
    let examIDs: [String]
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.createdOn = Date().timeIntervalSince1970
        self.updatedOn = Date().timeIntervalSince1970
        self.subjectIDs = []
        self.examIDs = []
    }
    
    // MARK: - Hashable Conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // MARK: - Equatable Conformance
    static func == (lhs: Topic, rhs: Topic) -> Bool {
        return lhs.id == rhs.id
    }
}
