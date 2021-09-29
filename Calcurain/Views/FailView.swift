//
//  FailView.swift
//  Calcurain
//
//  Created by Ali Safari on 11/20/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import UIKit

public class FailView: UIView {
    @IBOutlet public var insideView: UIView!
    @IBOutlet public var scoreLabel: UILabel!
    @IBOutlet public var bestScoreLabel: UILabel!
    @IBOutlet public var replayButton: UIButton!
    @IBOutlet public var mainMenuButton: UIButton!
    
    func setUp() {
        insideView.layer.cornerRadius = 10
        replayButton.layer.cornerRadius = 5
        mainMenuButton.layer.cornerRadius = 5
    }
    
}
