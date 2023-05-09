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
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionNumber = 0
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        print(quiz.count - 1)
           }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        var secondsRemaining = 2
        let userAnswer = sender.currentTitle // going to be equal to string answer true or false
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
//            print("Right")
            sender.backgroundColor = UIColor.green
        } else {
//            print("Wrong")
            sender.backgroundColor = UIColor.red

        }
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { (Timer) in
               if secondsRemaining > 0 {
                   print ("\(secondsRemaining) seconds")
                   secondsRemaining -= 1
               } else {
                   Timer.invalidate()
                self.updateUI()
               }
           }
        
        if questionNumber <= quiz.count - 2 {
            let progressPercentage = Float(questionNumber) / Float(quiz.count)
            progressBar.progress = progressPercentage
            print(progressPercentage)
            print("\(progressBar.progress) ---- should be the progress")
            questionNumber += 1
            


        } else {
            print("Out of Questions, Time to restart")
            restartQuiz()
            updateUI()
            
        }
        

        
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    func restartQuiz() {
         questionNumber = 0
    }
    
    
}

