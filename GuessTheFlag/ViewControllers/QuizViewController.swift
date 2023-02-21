//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 21/02/23.
//

import UIKit

final class QuizViewController: UIViewController {

    @IBOutlet var flagImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flagImage.image = UIImage(named: "ae")
    }


}

