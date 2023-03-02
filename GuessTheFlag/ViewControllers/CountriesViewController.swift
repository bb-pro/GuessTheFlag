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
    private var countries: [String] = []
    private var isoCodes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        regionNames.forEach { region in
            region.layer.cornerRadius = 15
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let countryListVC = segue.destination as? CountryListViewController else {
            return
        }
        countryListVC.countries = countries
        countryListVC.isoCodes = isoCodes
        countryListVC.navigationItem.title = regionName
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
        flags.forEach { (key, value) in
            countries.append(key)
            isoCodes.append(value)
        }
    }
    
}
