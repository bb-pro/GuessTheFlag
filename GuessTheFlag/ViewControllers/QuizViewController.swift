//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 21/02/23.
//

import UIKit
import AVFoundation

final class QuizViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var flagButtons: [UIButton]!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var hearts: [UIImageView]!
    
    //MARK: - Public Properties
    var flags: [String: String]!
    var flag: String!
    var userChoice: String!
    var scoreCount = 0
    var heartCount = 0
    
    //MARK: - Private Properties
    private var selected: String!
    private var player: AVAudioPlayer!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let recordVC = segue.destination as? ResultScreenViewController? else {
            return
        }
        recordVC?.result = scoreCount
    }
    
    //MARK: - IB Actions
    @IBAction func AnswerButtonPressed(_ sender: UIButton) {
        
        checkAnswer(sender)

        Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @IBAction func goBack() {
        dismiss(animated: true)
    }
    
}
    //MARK: - Private Methods
extension QuizViewController {
    
    @objc func updateUI() {
        flagButtons.forEach { button in
            button.layer.cornerRadius = 15
            button.backgroundColor = .lightGray
        }
        
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
                playSound(soundName: "A")
            } else {
                playErrorSound(soundName: "E")
                if heartCount < 4 {
                    hearts[heartCount].isHidden = true
                    heartCount += 1
                } else {
                    hearts[heartCount].isHidden = true
                    performSegue(withIdentifier: "showResult", sender: nil)
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
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    func playErrorSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
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

