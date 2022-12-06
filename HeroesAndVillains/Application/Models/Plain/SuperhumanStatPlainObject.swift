//
//  SuperhumanStatPlainObject.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 02.11.2022.
//


import Foundation
import SDAO

// MARK: - SuperhumanStatPlainObject
public struct SuperhumanStatPlainObject: Decodable, Plain {
    
    // MARK: - Properties
    
    /// Unique id of stat
    public var uniqueId: UniqueID {
        UniqueID(rawValue: longName + String(value))
    }
    
    /// Stat's long name (example: "speed")
    let longName: String
    
    /// Stat's short name (example: "spd")
    let shortName: String
    
    /// Integer stat's value
    let value: Int
}
