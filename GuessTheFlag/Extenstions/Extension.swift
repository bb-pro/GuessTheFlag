//
//  File.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 22/02/23.
//

import UIKit


//MARK: - Private Methods
extension QuizViewController {
    
    @objc func updateUI() {
        flagButtons.forEach { button in
            button.layer.cornerRadius = 15
        }
        
        view.addVerticalGradientLayer()
        
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
                if heartCount < 4 {
                    hearts[heartCount].isHidden = true
                    heartCount += 1
                } else {
                    hearts[heartCount].isHidden = true
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

// MARK: - Set background color
extension UIView {
    func addVerticalGradientLayer() {
        let primaryColor = UIColor(
            red: 210/255,
            green: 109/255,
            blue: 128/255,
            alpha: 1
        )
        
        let secondaryColor = UIColor(
            red: 107/255,
            green: 148/255,
            blue: 230/255,
            alpha: 1
        )
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}

