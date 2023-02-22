//
//  NavigationScreenViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 22/02/23.
//

import UIKit

final class NavigationScreenViewController: UIViewController {
    
    @IBOutlet var navigationButtons: [UIButton]!

    private var flags: [String: String]!
    private var regionName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        navigationButtons.forEach { button in
            button.layer.cornerRadius = 15
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationVC = segue.destination as? UINavigationController {
            navigationVC.navigationBar.topItem?.title = regionName
            guard let quizVC = navigationVC.topViewController as? QuizViewController else { return}
            quizVC.flags = flags
        }
        

        
    }
    
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

private extension NavigationScreenViewController {
    func updateUI(with title: String) {
        switch title {
        case "Азия":
            flags = FlagManager.parseAsianCountriesJson()
        case "Европа":
            flags = FlagManager.parseEuropeCountriesJson()
        case "Африка":
            flags = FlagManager.parseAfricanCountriesJson()
        case "Америки":
            flags = FlagManager.parseAmericanCountriesJson()
        default:
            flags = FlagManager.parseAll()
        }
    }
}




