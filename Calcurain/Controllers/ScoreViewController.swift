//
//  ScoreViewController.swift
//  Calcurain
//
//  Created by Ali Safari on 11/28/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    private var scoreView: ScoreView! {
        guard isViewLoaded else { return nil }
        return (view as! ScoreView)
    }
    
    private var easyScore = Score()
    private var hardScore = Score()
    private var mathFreakScore = Score()
    private let scoreCarataker = ScoreCarataker()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        loadScores()
        setupLabels()
        
    }
    
    private func loadScores() {
        easyScore = scoreCarataker.load(thisScore: "Easy")
        hardScore = scoreCarataker.load(thisScore: "Hard")
        mathFreakScore = scoreCarataker.load(thisScore: "Math Freak")
    }
    
    private func setupLabels() {
        scoreView.easyLabel.text = String(easyScore.scoreToSave)
        scoreView.hardLabel.text = String(hardScore.scoreToSave)
        scoreView.mathFreakLabel.text = String(mathFreakScore.scoreToSave)
    }
    

   

}
