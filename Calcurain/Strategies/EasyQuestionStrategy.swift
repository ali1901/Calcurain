//
//  EasyQuestionStrategy.swift
//  Calcurain
//
//  Created by Ali Safari on 11/22/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import Foundation

public class EasyQuestionStrategy: QuestionStrategy {
    public var title: String = "Easy"
    public var currentScore: Int = 0
    public var answerChooser: Int = 0
    private var bounds = upperBounds(numA: 0, numB: 0, opr: 0)
    
    public func provideQuestion() -> Question {
        checkScore(score: currentScore)
        currentScore += 1
        var question = Question()
        question.numA = randomProvider(upperbound: bounds.numA)
        question.numB = randomProvider(upperbound: bounds.numB)
        question.operand = randomProvider(upperbound: bounds.opr)
        answerChooser = randomProvider(upperbound: 2)
        if question.operand == 2 {
            if question.numA > 10 && question.numB > 10 {
                question.numA = randomProvider(upperbound: 10)
            }
        }
        
        return question
    }
    
    
    private func randomProvider(upperbound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperbound)))
    }
    
    private func checkScore(score: Int) {
        if score < 20 {
            bounds = upperBounds(numA: 20, numB: 20, opr: 2)
        } else if score < 50 {
            bounds = upperBounds(numA: 40, numB: 40, opr: 3)
        } else {
            bounds = upperBounds(numA: 100, numB: 100, opr: 3)
        }
    }
    
    private struct upperBounds {
        var numA: Int
        var numB: Int
        var opr: Int
    }
}
