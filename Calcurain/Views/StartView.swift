//
//  StartView.swift
//  Calcurain
//
//  Created by Ali Safari on 11/22/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import UIKit

public class StartView: UIView {
    @IBOutlet public var blurView: UIVisualEffectView!
    @IBOutlet public var insideView: UIView!
    @IBOutlet public var playButton: UIButton!
    @IBOutlet public var scoreButton: UIButton!
    @IBOutlet public var aboutButton: UIButton!
    @IBOutlet public var closseButton: UIButton!
    @IBOutlet weak var veView: UIVisualEffectView!
    
    func setUp() {
        playButton.layer.cornerRadius = 5
        aboutButton.layer.cornerRadius = 5
        insideView.layer.cornerRadius = 10
//        animatingButton()
    }
    
    func animatingButton() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.repeat, .autoreverse, .allowUserInteraction], animations: {
            self.playButton.transform = self.playButton.transform.scaledBy(x: 1.13, y: 1.13)
            self.aboutButton.transform = self.aboutButton.transform.scaledBy(x: 1.12, y: 1.12)
            self.scoreButton.transform = self.scoreButton.transform.scaledBy(x: 1.11, y: 1.11)
        })
    }
}
