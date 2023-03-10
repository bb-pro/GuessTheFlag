//
//  Record.swift
//  GuessTheFlag
//
//  Created by Bektemur Mamashayev on 01/03/23.
//

import Foundation

final class Record {
    static var record: Int! {
        get {
            return UserDefaults.standard.integer(forKey: "Record")
        } set {
            let defaults = UserDefaults.standard
            if let record = newValue {
                defaults.set(record, forKey: "Record")
            }
        }
    }
}
