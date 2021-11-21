//
//  Quizbrain.swift
//  Quizzler-iOS13
//
//  Created by Ryan Anderson on 11/12/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        
    ]
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        print(userAnswer)
        if userAnswer == quiz[questionNumber].correctAnswer {
            self.score += 1
            return true
        }else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getAnswerText(whichAnswer: Int) -> [String] {
        return quiz[questionNumber].answer[whichAnswer].text
    }
    
    func getProgress() -> Float{
        let a = Float(questionNumber + 1)
        let b = Float(quiz.count)
        return a / b
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 != quiz.count {
            questionNumber += 1
        } else {
            
            self.score = 0
            self.questionNumber = 0
        }
    }
    
    func gameOver(_ viewContorller: ViewController) -> Void {
        let scoreAlertController = UIAlertController(title: "Game Over", message: "Score: \(score) out of \(quiz.count)", preferredStyle: .alert)
        let closeButton = UIAlertAction(title: "Restart Game?", style: .destructive, handler: .none)
        scoreAlertController.addAction(closeButton)
        return viewContorller.present(scoreAlertController, animated: true, completion: viewContorller.updateUI)
    }
}
