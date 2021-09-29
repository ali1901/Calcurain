//
//  StartingViewController.swift
//  Calcurain
//
//  Created by Ali Safari on 11/22/20.
//  Copyright © 2020 Ali Safari. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {
    
    //MARK: - Properties
    public var startView: StartView! {
        guard isViewLoaded else { return nil }
        return (view as! StartView)
    }
    private var questionStrategy: QuestionStrategy!

    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startView.setUp()
        
        startView.veView.isHidden = true
        startView.veView.alpha = 0.0
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        startView.veView.isHidden = true
        startView.veView.alpha = 0.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? QuestionViewController {
            nextVC.questionHandler = questionStrategy
        }
    }

    //MARK: - IBActions
    @IBAction public func playTapped(_ sender: Any) {
        UIView.animate(withDuration: 1.0) {
            self.startView.veView.isHidden = false
            self.startView.veView.alpha = 1.0
        }
    }
    
    @IBAction public func aboutTapped(_ sender: Any) {
        
    }
    
    @IBAction public func easyTapped(_ sender: Any) {
        questionStrategy = EasyQuestionStrategy()
        performSegue()
    }
    
    @IBAction public func hardTapped(_ sender: Any) {
        questionStrategy = HardQuestionStrategy()
        performSegue()
    }
    
    @IBAction public func mathFreakTapped(_ sender: Any) {
        questionStrategy = MathFreakQuestionStrategy()
        performSegue()
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 1.0, animations: {
            self.startView.veView.alpha = 0.0
        }) { (completed) in
            self.startView.veView.isHidden = true
        }
    }
    
    //MARK: - Custom Funcs
    private func performSegue() {
        performSegue(withIdentifier: "SVCtoQVC", sender: Any?.self)
    }

}
