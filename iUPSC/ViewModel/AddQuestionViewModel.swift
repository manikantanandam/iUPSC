//
//  AddQuestionViewModel.swift
//  iUPSC
//
//  Created by Manikanta Nandam on 01/05/25.
//

import Foundation
enum QuestionManagementContext {
    case create
    case edit(Question)
}

class QuestionManagementViewModel: ObservableObject {
    
    let context: QuestionManagementContext
    var topic: Topic
    let topicsServiceManager: TopicsServiceManager
    
    @Published var question: Question {
        didSet {
            objectWillChange.send() // Explicitly notify SwiftUI
        }
    }
    
    init(
        topic: Topic,
        topicsServiceManager: TopicsServiceManager,
        context: QuestionManagementContext
    ) {
        self.topic = topic
        self.topicsServiceManager = topicsServiceManager
        self.context = context
        switch context {
        case .create:
            self.question = Question(question: "")
        case .edit(let question):
            self.question = question
        }
    }
    
    func addAnswerButtonTapped() {
        let newAnswer = Answer(serialNumber: question.answers.count + 1, answer: "")
        question.answers.append(newAnswer)
        objectWillChange.send() // Ensure SwiftUI is updated
        print("Answers count: \(question.answers.count)")
    }
    
    @MainActor
    func save() async {
        switch context {
        case .create:
            topic.questions.append(question)
        case .edit(let question):
            if let index = topic.questions.firstIndex(of: question) {
                topic.questions[index] = self.question
            }
        }
        
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
