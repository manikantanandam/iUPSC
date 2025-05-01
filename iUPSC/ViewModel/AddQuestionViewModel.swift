//
//  AddQuestionViewModel.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Foundation

class AddQuestionViewModel: ObservableObject {
    let topic: Topic
    let topicsServiceManager: TopicsServiceManager
    
    @Published var question: Question = Question(question: "") {
        didSet {
            objectWillChange.send() // Explicitly notify SwiftUI
        }
    }
    
    init(topic: Topic, topicsServiceManager: TopicsServiceManager) {
        self.topic = topic
        self.topicsServiceManager = topicsServiceManager
    }
    
    func addAnswerButtonTapped() {
        let newAnswer = Answer(serialNumber: question.answers.count + 1, answer: "")
        question.answers.append(newAnswer)
        objectWillChange.send() // Ensure SwiftUI is updated
        print("Answers count: \(question.answers.count)")
    }
    
    func save() async {
        topic.questions.append(question)
        do {
            guard
                question.valid
            else { return }

            try await topicsServiceManager.updateTopic(subject: topic)
            question = Question(question: "")
        } catch {
            print("Unable to update the topic")
        }
    }
}
