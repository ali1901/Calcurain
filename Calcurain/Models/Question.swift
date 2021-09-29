//
//  Question.swift
//  Calcurain
//
//  Created by Ali Safari on 11/19/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import Foundation

public struct Question {
    public var numA: Int = 0
    public var numB: Int = 0
    public var operand: Int = 0
    public var answer: Float {
        get {
            switch self.operand {
            case 0:
                return Float(numA + numB)
            case 1:
                return Float(numA - numB)
            case 2, 4:
                return Float(numA * numB)
            case 3, 5:
                return Float(numA) / Float(numB)
            default:
                return 0
            }
        }
    }
    
    public var wrongAnswer: Float {
        get {
            switch self.operand {
            case 0:
                return Float(numA + numB + randomProvider(upperbound: 5))
            case 1:
                return Float(numA - numB - randomProvider(upperbound: 5))
            case 2, 4:
                return Float(numA * numB + randomProvider(upperbound: 5))
            case 3, 5:
                return Float(numA) / Float(numB) + Float(randomProvider(upperbound: 5))
            default:
                return 0
            }
        }
    }
    
    private func randomProvider(upperbound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperbound))) + 1
    }
}
