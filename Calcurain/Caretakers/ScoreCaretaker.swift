//
//  ScoreCaretaker.swift
//  Calcurain
//
//  Created by Ali Safari on 11/22/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import Foundation

public class ScoreCarataker {
    var score = Score()
    let caretaker = DiskCaretaker()
    
    private func shouldSave(score: Score) -> Bool {
        if let savedScore = try? caretaker.load(title: score.scoreTitle) {
            if savedScore.scoreToSave < score.scoreToSave {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
    
    public func save(score: Score) {
        if shouldSave(score: score) {
            try? caretaker.save(score: score)
        }
    }
    
    public func load(thisScore: String) -> Score {
        if let score = try? caretaker.load(title: thisScore) {
            self.score = score
        } else {
            
        }
        return score
    }
}
