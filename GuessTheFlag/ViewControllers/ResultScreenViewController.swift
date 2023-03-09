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
        updateUI()
        UIView.animate(withDuration: 1.5) {
            self.stickerImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
    }
    override func viewDidLayoutSubviews() {
        view.backgroundColor = .secondaryLabel
    }
    
    //MARK: - IB Actions
    @IBAction func goBack() {
        self.navigationController?.popToRootViewController(animated: true)

    }
}

    //MARK: - Private Methods
private extension ResultScreenViewController {
    
    func updateUI() {
        navigationItem.hidesBackButton = true
        resultButton.setTitle(String(result), for: .normal)
        stickerImage.layer.cornerRadius = stickerImage.frame.width / 2
        if result > UserDefaults.standard.integer(forKey: "Record") {
            UserDefaults.standard.set(result, forKey: "Record")
        }
        recordLabel.text = String(Record.record)
    }
}
