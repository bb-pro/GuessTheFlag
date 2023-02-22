//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 21/02/23.
//

import UIKit
final class QuizViewController: UIViewController {
    
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var flagButtons: [UIButton]!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var hearts: [UIImageView]!
    
    
    private let flags = FlagManager.parseJson()
    var flag: String!
    var userChoice: String!
    var scoreCount = 0
    var heartCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        flagButtons.forEach { button in
            button.layer.cornerRadius = 10
        }
        updateUI()
    }
    
    
    
    @IBAction func AnswerButtonPressed(_ sender: UIButton) {
        
        
        checkAnswer(sender)
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        
    }
    @IBAction func goBack() {
        dismiss(animated: true)
    }
    
}



//MARK: - Private Methods
private extension QuizViewController {
    
    @objc func updateUI() {
        
        var answers: [String: String] = [:]
        for (button, answer) in zip(flagButtons, flags.shuffled()) {
            button.setTitle(answer.key, for: .normal)
            answers[answer.key] = answer.value
        }
        
        if let correctAnswer = answers.randomElement() {
            flag = correctAnswer.key
            flagImage.image = UIImage(named: correctAnswer.value.lowercased())
            
        }
        
        flagButtons.forEach { button in
            button.backgroundColor = .white
        }
    }
    
    func checkAnswer(_ sender: UIButton) {
        
        if let buttonTitle = sender.title(for: .selected) {
            if buttonTitle == flag {
                scoreCount += 1
                scoreLabel.text = "\(scoreCount)"
                sender.backgroundColor = .green
            } else {
                if heartCount < 2 {
                    hearts[heartCount].isHidden = true
                    heartCount += 1
                } else {
                    showAlert(title: "Проиграно", message: "Ваши баллы: \(scoreCount)")
                }
                
                sender.backgroundColor = .red
                flagButtons.forEach { button in
                    if button.title(for: .normal) == flag {
                        button.backgroundColor = .green
                    }
                }
            }
        }
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
