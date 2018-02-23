//
//  Question.swift
//  Quizzler
//
//  Created by Deep on 2017-11-18.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    // simple class with a constructor to intialize
    init(text: String, correctAnswer : Bool){
        questionText = text
        answer = correctAnswer
    }
    
}
