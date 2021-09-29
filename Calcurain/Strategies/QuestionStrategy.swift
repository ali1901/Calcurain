//
//  QuestionStrategy.swift
//  Calcurain
//
//  Created by Ali Safari on 11/22/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import Foundation

public protocol QuestionStrategy: class {
    var title: String { get }
    var currentScore: Int { get set }
    var answerChooser: Int { get set }
    
    func provideQuestion() -> Question
    
}
