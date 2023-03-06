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
    
    let description = [
        "А́зия — крупнейшая часть света, как по территории, так и по численности населения и его плотности.",
        "Аме́рика — часть света, объединяющая два материка, Северную и Южную Америки.",
        "Евро́па — часть света в Северном полушарии, имеющая площадь около 10,3 млн км².",
        "А́фрика — второй по площади материк после Евразии.",
        "Вся планета Земла"
                       ]
    
    let asianData: [CountriesWithRegions] = parseAsianCountriesJson()
    let americasData: [CountriesWithRegions] = parseAmericanCountriesJson()
    let europeData: [CountriesWithRegions] = parseEuropeCountriesJson()
    let allCountries: [CountriesWithRegions] = parseAll()
    let africanData: [CountriesWithRegions] = parseAfricanCountriesJson()
    
    let regions: [String] = [
        "Азия",
        "Америки",
        "Европа",
        "Африка",
        "Все страны"
    ]
    private static func parseAsianCountriesJson() -> [CountriesWithRegions] {
        var asianCountries: [CountriesWithRegions] = []
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
        return asianCountries
    }
    
    private static func parseAmericanCountriesJson() -> [CountriesWithRegions] {
        var parsedCountries: [CountriesWithRegions] = []
                
        if let path = Bundle.main.path(forResource: "all", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countries = try JSONDecoder().decode([CountriesWithRegions].self, from: data)
                
                // countries is an array of CountriesWithRegions structs, where each has a code and name property
                for country in countries {
                    if country.region == "Americas" {
                        parsedCountries.append(country)
                    }
                }
                
            } catch {
                print("Error: \(error)")
            }
        }
        return parsedCountries
    }
    
    private static func parseEuropeCountriesJson() -> [CountriesWithRegions] {
        var parsedCountries: [CountriesWithRegions] = []
        
        if let path = Bundle.main.path(forResource: "all", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countries = try JSONDecoder().decode([CountriesWithRegions].self, from: data)
                
                // countries is an array of CountriesWithRegions structs, where each has a code and name property
                for country in countries {
                    if country.region == "Europe" {
                        parsedCountries.append(country)
                    }
                }
                
            } catch {
                print("Error: \(error)")
            }
        }
        return parsedCountries
    }
    
    private static func parseAfricanCountriesJson() -> [CountriesWithRegions] {
        var parsedCountries: [CountriesWithRegions] = []
        
        if let path = Bundle.main.path(forResource: "all", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countries = try JSONDecoder().decode([CountriesWithRegions].self, from: data)
                
                // countries is an array of CountriesWithRegions structs, where each has a code and name property
                for country in countries {
                    if country.region == "Africa" {
                        parsedCountries.append(country)
                    }
                }
                
            } catch {
                print("Error: \(error)")
            }
        }
       
        return parsedCountries
    }
    
    private static func parseAll() -> [CountriesWithRegions] {
        var parsedCountries: [CountriesWithRegions] = []
        
        if let path = Bundle.main.path(forResource: "all", ofType: "json"){
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countries = try JSONDecoder().decode([CountriesWithRegions].self, from: data)
                
                // countries is an array of CountriesWithRegions structs, where each has a code and name property
                for country in countries {
                    parsedCountries.append(CountriesWithRegions(
                        name: country.name,
                        alpha: country.alpha,
                        region: country.region))
                    
                }
                
            } catch {
                print("Error: \(error)")
            }
        }
       
        return parsedCountries
    }
    
}
