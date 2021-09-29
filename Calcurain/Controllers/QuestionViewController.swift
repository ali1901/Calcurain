//
//  ViewController.swift
//  Calcurain
//
//  Created by Ali Safari on 11/19/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import UIKit
import AVFoundation

class QuestionViewController: UIViewController {

    // MARK: - Instance Properties
    public var questionHandler: QuestionStrategy! //EasyQuestionStrategy()//QuestionHandler()
    public var currentQuestion = Question()
    
    public var questionView: QuestionView! {
        guard isViewLoaded else { return nil }
        return (view as! QuestionView)
    }
    
    var score = Score()
    var currentScore = 0 
    let scoreCaretaker = ScoreCarataker()
    
    private weak var progressViewTimer: Timer?
    
    private let progress = Progress(totalUnitCount: 10)
    
    // MARK: - View Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()

        questionView.setup()
        nextQuestion()
        progressViewManager()
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? FailViewController {
            nextVC.score = currentScore
            nextVC.questionViewController = self
            nextVC.difficulty = questionHandler.title
        }
    }

    // MARK: - Custom Funcs
    private func showQuestion() {
        var answer: Float = 10.0
        if questionHandler.answerChooser == 0 {
            answer = currentQuestion.answer
        } else {
            answer = currentQuestion.wrongAnswer
        }
        var question = ""
        if questionHandler.title == "Math Freak" {
            question = "\(currentQuestion.numA) \(operandCharacter(for: currentQuestion.operand)) \(currentQuestion.numB) = \(answer)"
        } else {
            question = "\(currentQuestion.numA) \(operandCharacter(for: currentQuestion.operand)) \(currentQuestion.numB) = \(Int(answer))"
        }
        questionView.questionLabel.text = question
        questionView.scoreLabel.text = "Score: \(currentScore)"
    }
    
    private func nextQuestion() {
        currentQuestion = questionHandler.provideQuestion()
        showQuestion()
    }
    
    private func operandCharacter(for operand: Int) -> Character {
        switch operand {
        case 0:
            return "+"
        case 1:
            return "-"
        case 2, 4:
            return "*"
        case 3, 5:
            return "/"
        default:
            return " "
        }
    }
    
    private func failSequence() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        progressViewTimer?.invalidate()
        score.scoreToSave = currentScore
        score.scoreTitle  = questionHandler.title
        scoreCaretaker.save(score: score)
        performSegue(withIdentifier: "QVCtoFVC", sender: Any?.self)
    }
    
    public func replaySequence() {
        resetProgressView()
        progressViewManager()
        currentScore = 0
        nextQuestion()
    }
    
    public func exitSequence() {
        dismiss(animated: true, completion: nil)
    }
    
    private func progressViewManager() {
        progressViewTimer = Timer.scheduledTimer(withTimeInterval: 0.33, repeats: true, block: { (timer) in
            guard self.progress.isFinished == false else {
                self.failSequence()
                self.progressViewTimer?.invalidate()
                return
            }
            self.progress.completedUnitCount += 1
            let progressFloat = Float(self.progress.fractionCompleted)
            self.questionView.progressView.setProgress(progressFloat, animated: true)
        })
    }
    
    private func resetProgressView() {
        questionView.progressView.progress = 0.0
        progress.completedUnitCount = 0
    }
    
    // MARK: - IBActions
    @IBAction public func handleCorrect(_ sender: Any) {
        if questionHandler.answerChooser == 0 {
            currentScore += 1
            nextQuestion()
            questionView.scoreLabel.text = "Score: \(currentScore)"
        } else {
            failSequence()
        }
        resetProgressView()
    }
    
    @IBAction public func handleIncorrect(_ sender: Any) {
        if questionHandler.answerChooser == 1 {
            currentScore += 1
            nextQuestion()
            questionView.scoreLabel.text = "Score: \(currentScore)"
        } else {
            failSequence()
        }
        resetProgressView()
    }
    
}
