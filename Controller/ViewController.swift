//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    var quizBrain = QuizBrain()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }

    func updateUi() {
        questionLabel.text = quizBrain.getQuestionLabelText()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.firstButton.backgroundColor = UIColor.clear
            self.secondButton.backgroundColor = UIColor.clear
            self.thirdButton.backgroundColor = UIColor.clear
        }
        progressBarView.progress = quizBrain.getProgressBarPercentage()
        scoreLabel.text = "Quiz Score: \(quizBrain.getScore())"
        
        let optionAnswer = quizBrain.getCurrentOptionAnswer()
        self.firstButton.setTitle(optionAnswer[0] as? String, for: .normal) 
        self.secondButton.setTitle(optionAnswer[1] as? String, for: .normal)
        self.thirdButton.setTitle(optionAnswer[2] as? String, for: .normal)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.updateQuestionNumber()
        updateUi()
    }
}

