//
//  CountryInfoViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 02/03/23.
//

import UIKit

class CountryInfoViewController: UIViewController {
    @IBOutlet var countryFlag: UIImageView!
    @IBOutlet var countryName: UILabel!
    @IBOutlet var isoLabel: UILabel!
    
    var country: String!
    var isoCode: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryName.text = country
        isoLabel.text = isoCode
        countryFlag.image = UIImage(named: isoCode)
        
        UIView.animate(withDuration: 1.6) {
            self.countryFlag.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
    }
}
