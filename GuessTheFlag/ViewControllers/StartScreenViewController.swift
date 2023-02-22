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
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        buttons.forEach { button in
            button.layer.cornerRadius = 15
        }
    }

}

