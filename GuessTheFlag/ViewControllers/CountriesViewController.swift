//
//  CountriesViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 26/02/23.
//

import UIKit

class CountriesViewController: UIViewController {
    @IBOutlet var regionNames: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        regionNames.forEach { region in
            region.layer.cornerRadius = 15
        }
    }
}
