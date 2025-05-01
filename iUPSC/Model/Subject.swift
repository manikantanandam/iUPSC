//
//  Subject.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 29/04/25.
//

import Foundation

struct Subject: DictionaryConvertible, Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let createdOn: TimeInterval
    let updatedOn: TimeInterval
    let examIDs: [String]
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.createdOn = Date().timeIntervalSince1970
        self.updatedOn = Date().timeIntervalSince1970
        self.examIDs = []
    }
    
    // MARK: - Hashable Conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // MARK: - Equatable Conformance
    static func == (lhs: Subject, rhs: Subject) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Subject {
    var created: String {
        createdOn.formattedDate
    }
    
    var updated: String {
        updatedOn.formattedDate
    }
}
