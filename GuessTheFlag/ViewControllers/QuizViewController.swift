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
    
    
    private let flags = FlagManager.parseJson()
    var flag: String!
    var userChoice: String!
    var scoreCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        flagButtons.forEach { button in
            button.layer.cornerRadius = 25
        }
        updateUI()
    }
    
    @IBAction func AnswerButtonPressed(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .selected) {
            if buttonTitle == flag {
                scoreCount += 1
                scoreLabel.text = "\(scoreCount)"
                sender.backgroundColor = .green
            } else {
                sender.backgroundColor = .red
            }
        }
        updateUI()
        
    }
    
}



//MARK: - Private Methods
private extension QuizViewController {
    
    func updateUI() {
        
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
    
}
