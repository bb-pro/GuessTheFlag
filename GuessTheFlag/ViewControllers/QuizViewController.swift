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
    
    
    let flags = FlagManager.parseJson()
    var flag: String!
    var userChoice: String!
    var scoreCount = 0
    var heartCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    
    @IBAction func AnswerButtonPressed(_ sender: UIButton) {
        
        
        checkAnswer(sender)
        
        Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        
    }
    @IBAction func goBack() {
        dismiss(animated: true)
    }
    
}


