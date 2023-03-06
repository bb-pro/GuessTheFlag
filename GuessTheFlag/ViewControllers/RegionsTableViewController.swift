//
//  RegionsTableViewController.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 06/03/23.
//

import UIKit

final class RegionsTableViewController: UITableViewController {
    private let flagManager = FlagManager()
    private var flags: [CountriesWithRegions]!
    private var regionName: String!
    private var countries: [String] = []
    private var isoCodes: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let countryListVC = segue.destination as? CountryListViewController else { return }
        
        countryListVC.countries = countries
        countryListVC.isoCodes = isoCodes
    }

    

   
}
// MARK: - Table view data source
extension RegionsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "regionCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: flagManager.regions[indexPath.section])
        content.text = flagManager.description[indexPath.section]
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        flagManager.regions.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        flagManager.regions[section].uppercased()
        

    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
//MARK: - UITableViewDelegate
extension RegionsTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0: flags = flagManager.asianData
        case 1: flags = flagManager.americasData
        case 2: flags = flagManager.europeData
        case 3: flags = flagManager.africanData
        default:
            flags = flagManager.allCountries
        }
        regionName = flagManager.regions[indexPath.section]
        flags.forEach { flag in
            countries.append(flag.name)
            isoCodes.append(flag.alpha.lowercased())
        }
        performSegue(withIdentifier: "showCountries", sender: nil)
    }
}

extension RegionListViewController {
  
}

