//
//  StartScreenViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 22/02/23.
//

import UIKit

final class StartScreenViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.cornerRadius = image.frame.width / 2
        let defaults = UserDefaults.standard
        defaults.set(0, forKey: "Record")
        buttons.forEach { button in
            button.layer.cornerRadius = 15
        }
        UIView.animate(withDuration: 1.5) {
            self.image.frame.origin.x += 100
            
            for button in self.buttons {
                button.frame.origin.x -= 100
            }
        }
    }
    

}

