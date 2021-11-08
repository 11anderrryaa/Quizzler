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
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    
    let quiz = [
        ["Four + two is equal to Six" : "True" ],
        ["Five - three is greater than One": "True"],
        ["Three + eight is less than Ten" : "False"]
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle
        let actualAsnwer = quiz[questionNumber][1]
        
        if userAnswer == actualAsnwer {
            print("Right")
        } else{
            print("Wrong")
        }
        questionNumber += 1
        updateUI()
    }
    
    func updateUI() {

          questionLabel.text = quiz[questionNumber][0]
    }
}
