//
//  QuestionHandler.swift
//  Calcurain
//
//  Created by Ali Safari on 11/19/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import Foundation

public class QuestionHandler {
    
    var answerChooser: Int = 0
    var score: Int = 0
    
    public func provideQuestion() -> Question {
        var question = Question()
        question.numA = randomProvider(upperbound: 20)
        question.numB = randomProvider(upperbound: 20) + 1
        question.operand = randomProvider(upperbound: 4)
        
        answerChooser = randomProvider(upperbound: 2)
        
        print(answerChooser)
      
        
        return question
    }
    
    
    private func randomProvider(upperbound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperbound)))
    }
}
