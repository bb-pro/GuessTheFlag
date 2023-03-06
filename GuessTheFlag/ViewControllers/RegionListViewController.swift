//
//  RegionListViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 06/03/23.
//

import UIKit

class RegionListViewController: UITableViewController {
    private let flagManager = FlagManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return flagManager.regions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "regionCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: "earth")
        content.text = flagManager.regions[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
}
