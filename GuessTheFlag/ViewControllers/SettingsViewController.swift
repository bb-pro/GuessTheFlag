//
//  SettingsViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 26/02/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func writeFeedbackPressed() {
        let url = URL(string: "bektemurmamashayev07@gmail.com")
        let activityViewController = UIActivityViewController(
            activityItems: [url],
            applicationActivities: nil
        )
        present(activityViewController, animated: true, completion: nil)
    }
    
}
