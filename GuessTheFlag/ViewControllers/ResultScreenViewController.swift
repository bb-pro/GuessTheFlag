//
//  ResultScreenViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 28/02/23.
//

import UIKit

class ResultScreenViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var stickerImage: UIImageView!
    @IBOutlet var resultButton: UIButton!
    @IBOutlet var recordLabel: UILabel!
    
    //MARK: - Public Properties
    var result: Int!
    let defaults = UserDefaults.standard
    var record: Int!
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        recordLabel.text = String(defaults.integer(forKey: "Record"))
        updateUI()
        
        
    }
    
    //MARK: - IB Actions
    @IBAction func goBack() {
        self.navigationController?.popToRootViewController(animated: true)

    }
}

    //MARK: - Private Methods
private extension ResultScreenViewController {
    func updateUI() {
        
       
        stickerImage.layer.cornerRadius = stickerImage.frame.width / 2
        
        if result < 10 {
            stickerImage.image = UIImage(named: "Image 6")
        } else {
            stickerImage.image = UIImage(named: "Image 5")
        }
        
        if result > defaults.integer(forKey: "Record") {
            defaults.set(result, forKey: "Record")
            UserDefaults.standard.synchronize()
            
        }
        
        
        resultButton.setTitle(String(result), for: .normal)
    }
}
