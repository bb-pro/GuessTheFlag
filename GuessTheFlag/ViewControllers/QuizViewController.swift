//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 21/02/23.
//

import UIKit

final class QuizViewController: UIViewController {

    @IBOutlet var flagImage: UIImageView!
    
    private let flags = FlagManager.parseJson()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

}

//Private Methods

private extension QuizViewController {
    func updateUI() {
        let number = Int.random(in: 0...100)
        flagImage.image = UIImage(named: flags[number].code.lowercased())
    }
}
