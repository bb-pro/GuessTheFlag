//
//  LearnFlagViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 27/02/23.
//

import UIKit

class LearnFlagViewController: UIViewController {
    
    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var isoLabel: UILabel!
    @IBOutlet var flagCountInfoLabel: UILabel!
    
    @IBOutlet var navigationButtons: [UIButton]!
    
    var flags: [String: String]!
    var regionName: String!
    private var indexNumber = 0
    private var isoCodes: [String] = []
    private var countryNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        updateUI()
    }
    
    @IBAction func showNextFlagTapped() {
        nextFlag()
    }
    
    @IBAction func showPreviousFlagTapped() {
        previousFlag()
    }
}

private extension LearnFlagViewController {
    func updateFlagData() {
        flags.keys.forEach { key in
            countryNames.append(key)
        }
        flags.values.forEach { value in
            isoCodes.append(value)
        }
    }
    func nextFlag() {
        updateFlagData()
        if indexNumber < countryNames.count - 1 {
            indexNumber += 1
            updateUI()
        } else {
            indexNumber = 0
        }
    }
    func previousFlag() {
        updateFlagData()
        if indexNumber > 0 {
            indexNumber -= 1
            updateUI()
        }
    }
    func updateUI() {
        updateFlagData()
        navigationButtons.forEach { button in
            button.layer.cornerRadius = 15
        }
        isoLabel.layer.cornerRadius = 15
        countryLabel.layer.cornerRadius = 15
        
        flagImage.image = UIImage(named: isoCodes[indexNumber])
        countryLabel.text = countryNames[indexNumber]
        isoLabel.text = isoCodes[indexNumber]
        navigationItem.title = regionName
        let flagCount = indexNumber + 1
        flagCountInfoLabel.text = "\(flagCount) из \(flags.count)"
    }
}
