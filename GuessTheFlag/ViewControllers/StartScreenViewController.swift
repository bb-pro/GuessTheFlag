//
//  StartScreenViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 22/02/23.
//

import UIKit

final class StartScreenViewController: UIViewController {

    
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        print(UserDefaults.standard.integer(forKey: "Record"))
        let defaults = UserDefaults.standard
        defaults.set(0, forKey: "Record")
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        buttons.forEach { button in
            button.layer.cornerRadius = 15
        }
    }

}

