//
//  QuestionView.swift
//  Calcurain
//
//  Created by Ali Safari on 11/19/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import UIKit

public class QuestionView: UIView {
    @IBOutlet public var scoreLabel: UILabel!
    @IBOutlet public var questionLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    public func setup() {

//        questionLabel.shadowOffset = CGSize(width: 3, height: 3)
//        questionLabel.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//        questionLabel.layer.shadowRadius = 20
//        questionLabel.layer.shadowOpacity = 1.0
//
        
        progressView.transform = progressView.transform.scaledBy(x: 1.0, y: 5.0)
        
        checkButton.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        checkButton.layer.shadowOffset = CGSize(width: 20, height: 20)
        checkButton.layer.shadowRadius = 20
        checkButton.clipsToBounds = true

    }
    
}
