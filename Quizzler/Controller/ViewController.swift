//
//  ViewController.swift
//  Quizzler
//
//  Created by Babayev Kamran on 24.11.22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var firstAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuestion()
        buttonsDesign()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            quizBrain.score += 1
            sender.backgroundColor = UIColor.green
            print("right")
        } else {
            sender.backgroundColor = UIColor.red
            print("wrong")
        }
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
        
        quizBrain.nextQuestion()
    }
    
    @objc func updateQuestion() {
        
        scoreLabel.text = "Score = \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestions()
        progressBar.progress = quizBrain.getProgress()
        
        
        let answers = quizBrain.getAnswer()
        firstAnswer.setTitle(answers[0], for: .normal)
        secondAnswer.setTitle(answers[1], for: .normal)
        thirdAnswer.setTitle(answers[2], for: .normal)
        

        buttonsDesign()
    }
    
    func buttonsDesign() {
        firstAnswer.layer.cornerRadius = 20
        secondAnswer.layer.cornerRadius = 20
        thirdAnswer.layer.cornerRadius = 20
        
        firstAnswer.backgroundColor = UIColor.placeholderText
        secondAnswer.backgroundColor = UIColor.placeholderText
        thirdAnswer.backgroundColor = UIColor.placeholderText
        
    }
    
}

