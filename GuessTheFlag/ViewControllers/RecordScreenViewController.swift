//
//  RecordScreenViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 03/03/23.
//

import UIKit

class RecordScreenViewController: UIViewController {

    @IBOutlet var recordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        recordLabel.text = String(UserDefaults.standard.integer(forKey: "Record"))
    }
}
