//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonFirst: UIButton!
    @IBOutlet weak var buttonSecond: UIButton!
    @IBOutlet weak var buttonThird: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var quizProgressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    var timer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        let answers = quizBrain.getAnswers()
        buttonFirst.setTitle(answers[0], for: UIControl.State.normal)
        buttonSecond.setTitle(answers[1], for: UIControl.State.normal)
        buttonThird.setTitle(answers[2], for: UIControl.State.normal)
        questionLabel.text = quizBrain.getQuestionText()
        quizProgressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        buttonFirst.backgroundColor = UIColor.clear
        buttonSecond.backgroundColor = UIColor.clear
        buttonThird.backgroundColor = UIColor.clear
    }


}

