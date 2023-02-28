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

struct CountriesWithRegions: Decodable {
    let name: String
    let alpha: String
    let region: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case alpha = "alpha-2"
        case region
    }
}

struct FlagManager {
    
    let asianData: [String: String] = parseAsianCountriesJson()
    let americasData: [String: String] = parseAmericanCountriesJson()
    let europeData: [String: String] = parseEuropeCountriesJson()
    let allCountries: [String: String] = parseAll()
    let africanData: [String: String] = parseAfricanCountriesJson()
    
    private static func parseAsianCountriesJson() -> [String: String] {
        var asianCountries: [CountriesWithRegions] = []
        var countryDict: [String: String] = [:]
        
        if let path = Bundle.main.path(forResource: "all", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countries = try JSONDecoder().decode([CountriesWithRegions].self, from: data)
                
                // countries is an array of CountriesWithRegions structs, where each has a code and name property
                for country in countries {
                    if country.region == "Asia" {
                        asianCountries.append(country)
                    }
                }
                
            } catch {
                print("Error: \(error)")
            }
        }
        asianCountries.forEach { country in
            countryDict[country.name] = country.alpha.lowercased()
        }
        return countryDict
    }
    
    private static func parseAmericanCountriesJson() -> [String: String] {
        var asianCountries: [CountriesWithRegions] = []
        var countryDict: [String: String] = [:]
        
        if let path = Bundle.main.path(forResource: "all", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countries = try JSONDecoder().decode([CountriesWithRegions].self, from: data)
                
                // countries is an array of CountriesWithRegions structs, where each has a code and name property
                for country in countries {
                    if country.region == "Americas" {
                        asianCountries.append(country)
                    }
                }
                
            } catch {
                print("Error: \(error)")
            }
        }
        asianCountries.forEach { country in
            countryDict[country.name] = country.alpha.lowercased()
        }
        return countryDict
    }
    
    private static func parseEuropeCountriesJson() -> [String: String] {
        var asianCountries: [CountriesWithRegions] = []
        var countryDict: [String: String] = [:]
        
        if let path = Bundle.main.path(forResource: "all", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countries = try JSONDecoder().decode([CountriesWithRegions].self, from: data)
                
                // countries is an array of CountriesWithRegions structs, where each has a code and name property
                for country in countries {
                    if country.region == "Europe" {
                        asianCountries.append(country)
                    }
                }
                
            } catch {
                print("Error: \(error)")
            }
        }
        asianCountries.forEach { country in
            countryDict[country.name] = country.alpha.lowercased()
        }
        return countryDict
    }
    
    private static func parseAfricanCountriesJson() -> [String: String] {
        var asianCountries: [CountriesWithRegions] = []
        var countryDict: [String: String] = [:]
        
        if let path = Bundle.main.path(forResource: "all", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countries = try JSONDecoder().decode([CountriesWithRegions].self, from: data)
                
                // countries is an array of CountriesWithRegions structs, where each has a code and name property
                for country in countries {
                    if country.region == "Africa" {
                        asianCountries.append(country)
                    }
                }
                
            } catch {
                print("Error: \(error)")
            }
        }
        asianCountries.forEach { country in
            countryDict[country.name] = country.alpha.lowercased()
        }
        return countryDict
    }
    
    private static func parseAll() -> [String: String] {
        var asianCountries: [CountriesWithRegions] = []
        var countryDict: [String: String] = [:]
        
        if let path = Bundle.main.path(forResource: "all", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countries = try JSONDecoder().decode([CountriesWithRegions].self, from: data)
                
                // countries is an array of CountriesWithRegions structs, where each has a code and name property
                for country in countries {
                    asianCountries.append(CountriesWithRegions(
                        name: country.name,
                        alpha: country.alpha,
                        region: country.region))
                    
                }
                
            } catch {
                print("Error: \(error)")
            }
        }
        asianCountries.forEach { country in
            countryDict[country.name] = country.alpha.lowercased()
        }
        return countryDict
    }
    
}
