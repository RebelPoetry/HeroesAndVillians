//
//  SuperhumanPlainObject.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 15.11.2022.
//

import Foundation
import SDAO

// MARK: - SuperhumanPlainObject

public struct SuperhumanPlainObject: Decodable, Plain {
    
    // MARK: - Properties
    
    /// Unique id for each superhuman
    public var uniqueId: UniqueID {
        UniqueID(rawValue: name + type)
    }
    
    /// Superhuman's name
    public let name: String
    
    /// Superhuman's type: superhero, supervillains, etc.
    public let type: String
    
    /// URL of image with superhuman
    public let imageURL: URL
    
    /// Background color of superhuman's card
    public let backgroundColorHex: String
    
    /// Superhuman stats instance
    public let stats: [SuperhumanStatPlainObject]
}
