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
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
//        print(quiz.count - 1)
           }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        var secondsRemaining = 2
        let userAnswer = sender.currentTitle! // going to be equal to string answer true or false
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight {
//            print("Right")
            sender.backgroundColor = UIColor.green
        } else {
//            print("Wrong")
            sender.backgroundColor = UIColor.red

        }
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { (Timer) in
               if secondsRemaining > 0 {
//                   print ("\(secondsRemaining) seconds")
                   secondsRemaining -= 1
               } else {
                   Timer.invalidate()
                self.updateUI()
               }
           }
        quizBrain.nextQuestion()
//        if questionNumber <= quiz.count - 2 {
////            updateUI()
//            questionNumber += 1
//            
//
//
//        } else {
//            print("Out of Questions, Time to restart")
//            //        progressBar.progress = 1.0
//            restartQuiz()
//            updateUI()
//            
//        }
        

        
    }
    
    func updateUI() {
//        questionLabel.text = quiz[questionNumber].text
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"

//        let progressPercentage = Float(questionNumber + 1) / Float(quiz.count)
//                 progressBar.progress = progressPercentage
//                 print(progressPercentage)
//                 print("\(progressBar.progress) ---- should be the progress")
    }
    

    
    
}

