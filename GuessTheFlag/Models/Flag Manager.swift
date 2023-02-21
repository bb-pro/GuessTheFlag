//
//  Flag Manager.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 21/02/23.
//

import Foundation


struct Country:Decodable {
    let Code: String
    let Name: String
}


struct FlagManager {
    
    static func parseJson() -> [Flag] {
        var countryDict: [Flag] = []
        if let path = Bundle.main.path(forResource: "data", ofType: "json"){
            
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countries = try JSONDecoder().decode([Country].self, from: data)
                
                // countries is an array of Country structs, where each Country has a code and name property
                
                for country in countries {
                    countryDict.append(Flag(country: country.Name, code: country.Code))
                    
                }
                
            } catch {
                print("Error: \(error)")
            }
        }
        return countryDict
    }
}
