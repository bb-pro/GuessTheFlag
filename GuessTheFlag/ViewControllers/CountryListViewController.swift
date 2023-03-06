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
        navigationItem.hidesBackButton = true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoVC = segue.destination as? CountryInfoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        infoVC.country = countries[indexPath.row]
        infoVC.isoCode = isoCodes[indexPath.row]
        infoVC.navigationItem.title = self.navigationItem.title
    }
    
    @IBAction func goBack() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - Table view data source
extension CountryListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "country", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = countries[indexPath.row]
        content.image = UIImage(named: isoCodes[indexPath.row])
        content.imageProperties.maximumSize.width = 60
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        return cell
    }
}

extension CountryListViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
