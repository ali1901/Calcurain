//
//  FailViewController.swift
//  Calcurain
//
//  Created by Ali Safari on 11/20/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import UIKit

class FailViewController: UIViewController {

    //MARK: - Instance Properties
    public var failView: FailView! {
        guard isViewLoaded else { return nil }
        return (view as! FailView)
    }
    private let scoreCaretaker = ScoreCarataker()
    public var questionViewController: QuestionViewController!
    public var difficulty = ""
    
    public var score = 0
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        isModalInPresentation = true
    }

    //MARK: - Custom Funcs
    private func setUpView() {
        let bestScore = loadScore()
        failView.scoreLabel.text = "Your score: \(score)"
        failView.bestScoreLabel.text = "Best score: \(bestScore)"
        failView.setUp()
    }
    
    private func loadScore() -> String {
        let bestScore = String(scoreCaretaker.load(thisScore: difficulty).scoreToSave)
        return bestScore
    }
    
    //MARK: - IBActions
    @IBAction public func replayTapped(_ sender: Any) {
        questionViewController.replaySequence()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction public func mainMenuTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        questionViewController.exitSequence()
    }

}
