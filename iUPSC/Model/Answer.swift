//
//  Answer.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Foundation

struct Answer: DictionaryConvertible, Codable, Identifiable, Hashable {
    let id: String
    let serialNumber: Int
    let createdOn: TimeInterval
    let updatedOn: TimeInterval
    var answer: String
    
    init(serialNumber: Int, answer: String) {
        self.id = UUID().uuidString
        self.serialNumber = serialNumber
        self.answer = answer
        self.createdOn = Date().timeIntervalSince1970
        self.updatedOn = Date().timeIntervalSince1970
    }
    
    // MARK: - Hashable Conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(serialNumber)
        hasher.combine(answer)
    }

    // MARK: - Equatable Conformance
    static func == (lhs: Answer, rhs: Answer) -> Bool {
        return lhs.id == rhs.id
    }
}
