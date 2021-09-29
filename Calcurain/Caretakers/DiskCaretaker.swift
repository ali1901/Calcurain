//
//  DiskCaretaker.swift
//  Calcurain
//
//  Created by Ali Safari on 11/22/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import Foundation

public class DiskCaretaker {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let userDefaults = UserDefaults.standard
    
    
    public func save(score: Score) throws {
        let data = try encoder.encode(score)
        userDefaults.set(data, forKey: score.scoreTitle)
    }
    
    
    public func load(title: String) throws -> Score {
        guard let data = userDefaults.data(forKey: title), let score = try? decoder.decode(Score.self, from: data) else {
            throw Error.gameNotFound
        }
        return score
    }
    
    public enum Error: String, Swift.Error {
        case gameNotFound
    }
    
}
