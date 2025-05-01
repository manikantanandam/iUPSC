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
    var questions: [Question]
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.createdOn = Date().timeIntervalSince1970
        self.updatedOn = Date().timeIntervalSince1970
        self.subjectIDs = []
        self.examIDs = []
        self.questions = []
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.createdOn = try container.decode(TimeInterval.self, forKey: .createdOn)
        self.updatedOn = try container.decode(TimeInterval.self, forKey: .updatedOn)
        self.subjectIDs = try container.decode([String].self, forKey: .subjectIDs)
        self.examIDs = try container.decode([String].self, forKey: .examIDs)
        self.questions = try container.decodeIfPresent([Question].self, forKey: .questions) ?? []
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
