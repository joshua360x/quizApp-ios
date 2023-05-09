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
        Question(q: "4 + 2 = 7", a: "False"),
        Question(q: "pizza is good", a: "False"),
        Question(q: "people are nice", a: "True")
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
        let actualAnswer = quiz[questionNumber].answer
        
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
        questionLabel.text = quiz[questionNumber].text
    }
    
    func restartQuiz() {
         questionNumber = 0
    }
    
    
}

