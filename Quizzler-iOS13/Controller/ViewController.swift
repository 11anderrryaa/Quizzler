//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
            
        } else {
            sender.backgroundColor = .red
        }
        
        if quizBrain.quiz.count - 1 != quizBrain.questionNumber {
            quizBrain.nextQuestion()
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else {
            quizBrain.gameOver(self)
            quizBrain.nextQuestion()
        }
    }
    
    @objc func updateUI() {
        
        Button1.setTitle(quizBrain.getButtonText(whichButton: 0), for: .normal)
        Button2.setTitle(quizBrain.getButtonText(whichButton: 1), for: .normal)
        Button3.setTitle(quizBrain.getButtonText(whichButton: 2), for: .normal)
        
        
        Button1.backgroundColor = .clear
        Button2.backgroundColor = .clear
        Button3.backgroundColor = .clear
        questionLabel.text = quizBrain.getQuestionText()

        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.score)"
    }
}
