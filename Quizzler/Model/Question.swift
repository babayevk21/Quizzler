//
//  Question.swift
//  Quizzler
//
//  Created by Babayev Kamran on 24.11.22.
//

import Foundation

struct Question {
    let questions: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.questions = q
        self.answers = a
        self.correctAnswer = correctAnswer
    }
    
}
