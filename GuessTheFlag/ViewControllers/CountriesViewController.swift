//
//  CountriesViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 26/02/23.
//

import UIKit

class CountriesViewController: UIViewController {
    
    @IBOutlet var regionNames: [UIButton]!
    
    private let flagManager = FlagManager()
    
    private var flags: [String: String]!
    private var regionName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        regionNames.forEach { region in
            region.layer.cornerRadius = 15
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let learnFlagVC = segue.destination as? LearnFlagViewController else {
            return
        }
        learnFlagVC.flags = flags
        learnFlagVC.regionName = regionName
    }
    
    @IBAction func regionSelected(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        regionName = buttonTitle
        updateUI(with: regionName)
        performSegue(withIdentifier: "showFlags", sender: nil)
    }
}

private extension CountriesViewController {
    func updateUI(with title: String) {
        switch title {
        case "Азия":
            flags = flagManager.asianData
        case "Америки":
            flags = flagManager.americasData
        case "Европа":
            flags = flagManager.europeData
        case "Африка":
            flags = flagManager.africanData
        default:
            flags = flagManager.allCountries
        }

    }
}
