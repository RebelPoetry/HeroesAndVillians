//
//  SuperhumanCellViewModel.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 16.11.2022.
//

import Foundation

// MARK: - SuperhumanCellViewModel

public struct SuperhumanCellViewModel: SuperhumanCellViewModelProtocol {
    
    // MARK: - Properties
    
    /// Superhuman object instance
    let superhuman: SuperhumanPlainObject
    
    /// Superhuman's name instance
    public var name: String {
        superhuman.name
    }
    
    /// Flag, that indicates is this superhuman in favorite list
    public var isFavorite = false
    
    /// Superhuman stats instance
    public var stats: [SuperhumanStatPlainObject] {
        superhuman.stats
    }
    
    /// URL of image with superhuman
    public var imageURL: URL {
        superhuman.imageURL
    }
    
    /// Background color of superhuman's card
    public var backgroundColorHex: String {
        superhuman.backgroundColorHex
    }
}
