//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Singgih Aji Sasongko on 09/10/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: Array<Any>
    let correct_answer: String
    
    init(q: String, a: Array<Any>, correctAnswer: String) {
        text = q
        answer = a
        correct_answer = correctAnswer
    }
}

