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
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    let quiz = [
    ["4 + 2 = 7", "False"],
    ["pizza is good", "False"],
        ["people are nice", "True"]
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        print(quiz.count - 1)
           }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle // going to be equal to string answer true or false
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer {
            print("Right")
        } else {
            print("Wrong")
        }
        
        if questionNumber <= quiz.count - 2 {
            questionNumber += 1
            updateUI()


        } else {
            print("Out of Questions, Time to restart")
            restartQuiz()
            updateUI()
            
        }
        
    }
    
    func updateUI() {
         questionLabel.text = quiz[questionNumber][0]
    }
    
    func restartQuiz() {
         questionNumber = 0
    }
    
    
}

