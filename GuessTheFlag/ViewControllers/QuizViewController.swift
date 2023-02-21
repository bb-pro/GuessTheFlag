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
    
    private var countryName: String!
    private let flags = FlagManager.parseJson()
    private var scoreCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AnswerButtonPressed(_ sender: UIButton) {
        checkAnswer(sender: sender)
        updateUI(with: sender)
        
        print(" user's choice \(sender.currentTitle)")
        
    }
    
}



//MARK: - Private Methods
private extension QuizViewController {
    func updateUI(with sender: UIButton) {
        let number = Int.random(in: 0...100)
        flagImage.image = UIImage(named: flags[number].code.lowercased())
        countryName = String(flags[number].country)
        
        updateButtonTitles(answer: countryName, with: flags)
        checkAnswer(sender: sender)
    }
    
    func updateButtonTitles(answer: String, with options: [Flag]) {
        var answerOptions = [answer]
        
        for _ in 1...3 {
            if let country = options.randomElement()?.country {
                answerOptions.append(country)
            }
            
            
        }
        
        let answers = Set(answerOptions)
        for (button, answer) in zip(flagButtons, answers) {
            button.setTitle(answer, for: .normal)
        }
    }
    func checkAnswer(sender: UIButton) {
        guard let countryTitle = sender.currentTitle else { return }
        if countryTitle == countryName {
            scoreCount += 1
            scoreLabel.text = String(scoreCount)
        }
    }
}


