//
//  QuestionDetailsViewModel.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Foundation

class QuestionDetailsViewModel: ObservableObject {
    let topic: Topic
    let question: Question
    init(topic: Topic, question: Question) {
        self.topic = topic
        self.question = question
    }
}
