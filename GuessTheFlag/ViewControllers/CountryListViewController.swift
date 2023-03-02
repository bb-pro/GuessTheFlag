//
//  CountryListViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 02/03/23.
//

import UIKit

class CountryListViewController: UITableViewController {
    var countries: [String]!
    var isoCodes: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func goBack() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - Table view data source
extension CountryListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "country", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = countries[indexPath.row]
        content.image = UIImage(named: isoCodes[indexPath.row])
        content.imageProperties.maximumSize.width = 40
        cell.contentConfiguration = content
        
        return cell
    }
}

extension CountryListViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
