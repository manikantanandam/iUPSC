//
//  Question.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Foundation

struct Question: DictionaryConvertible, Codable, Identifiable, Hashable {
    let id: String
    var question: String
    var answers: [Answer]
    let createdOn: TimeInterval
    let updatedOn: TimeInterval
    
    init(question: String) {
        self.id = UUID().uuidString
        self.question = question
        self.createdOn = Date().timeIntervalSince1970
        self.updatedOn = Date().timeIntervalSince1970
        self.answers = [
            Answer(serialNumber: 1, answer: "")
        ]
    }
    
    // MARK: - Hashable Conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(question)
        hasher.combine(answers)
    }

    // MARK: - Equatable Conformance
    static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.id == rhs.id && lhs.answers == rhs.answers
    }
}

extension Question {
    var valid: Bool {
        !question.isEmpty && answers.count > 0
    }
}
