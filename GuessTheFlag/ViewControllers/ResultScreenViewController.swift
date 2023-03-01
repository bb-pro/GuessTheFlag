//
//  ResultScreenViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 28/02/23.
//

import UIKit

class ResultScreenViewController: UIViewController {

    @IBOutlet var stickerImage: UIImageView!
    @IBOutlet var resultButton: UIButton!
    @IBOutlet var recordLabel: UILabel!
    
    var result: Int!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func goBack() {
        self.navigationController?.popToRootViewController(animated: true)

    }
    
    
}

private extension ResultScreenViewController {
    func updateUI() {
        let recordInt = UserDefaults.standard.integer(forKey: "Record")
        stickerImage.layer.cornerRadius = stickerImage.frame.width / 2
        if result < 10 {
            stickerImage.image = UIImage(named: "Image 6")
        } else {
            stickerImage.image = UIImage(named: "Image 5")
        }
        
        
        
        if result > recordInt {
            defaults.set(result, forKey: "Record")
            UserDefaults.standard.synchronize()
        }
        guard let userResult = result else { return }
        resultButton.setTitle(String(userResult), for: .normal)
        recordLabel.text = "\(defaults.integer(forKey: "Record"))"
    }
}
