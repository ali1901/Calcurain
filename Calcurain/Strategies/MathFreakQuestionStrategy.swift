//
//  MathFreakQuestionStrategy.swift
//  Calcurain
//
//  Created by Ali Safari on 11/22/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import Foundation

public class MathFreakQuestionStrategy: QuestionStrategy {
    public var title: String = "Math Freak"
    public var currentScore: Int = 0
    public var answerChooser: Int = 0
    private var bounds = upperBounds(numA: 0, numB: 0, opr: 0)
    
    public func provideQuestion() -> Question {
        checkScore(score: currentScore)
        currentScore += 1
        var question = Question()
        question.numA = randomProvider(upperbound: bounds.numA) + 11
        question.numB = randomProvider(upperbound: bounds.numB) + 11
        question.operand = randomProvider(upperbound: bounds.opr)
        answerChooser = randomProvider(upperbound: 2)
        if question.operand == 3 || question.operand == 6 {
            if question.numA < question.numB {
                let numC = question.numA
                question.numA = question.numB
                question.numB = numC
            }
        }
        
        return question
    }
    
    
    private func randomProvider(upperbound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperbound)))
    }
    
    private func checkScore(score: Int) {
        if score < 20 {
            bounds = upperBounds(numA: 100, numB: 100, opr: 4)
        } else if score < 50 {
            bounds = upperBounds(numA: 500, numB: 500, opr: 4)
        } else {
            bounds = upperBounds(numA: 1000, numB: 1000, opr: 6)
        }
    }
    
    private struct upperBounds {
        var numA: Int
        var numB: Int
        var opr: Int
    }
}
