//
//  NavigationScreenViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 22/02/23.
//

import UIKit

final class NavigationScreenViewController: UIViewController {
    //MARK: - IB Outlets
    @IBOutlet var navigationButtons: [UIButton]!
    //MARK: - Private Properties
    private var flags: [String: String]!
    private var regionName: String!
    private let flagManager = FlagManager()
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        navigationButtons.forEach { button in
            button.layer.cornerRadius = 15
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let quizVC = segue.destination as? QuizViewController else { return }
        quizVC.flags = flags
        }
    //MARK: - IB actions
    @IBAction func selectRegionPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        regionName = buttonTitle
        updateUI(with: buttonTitle)
        performSegue(withIdentifier: "showQuiz", sender: nil)
    }
    
    @IBAction func goBack() {
        dismiss(animated: true)
    }
}

//MARK: - Private Methods
private extension NavigationScreenViewController {
    func updateUI(with title: String) {
        switch title {
        case "Азия":
            flags = flagManager.asianData
        case "Европа":
            flags = flagManager.europeData
        case "Африка":
            flags = flagManager.africanData
        case "Америки":
            flags = flagManager.americasData
        default:
            flags = flagManager.allCountries
        }
    }
}




