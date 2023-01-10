//
//  SuperhumanCellViewModelProtocol.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 16.11.2022.
//

import Foundation

// MARK: - SuperhumanCellViewModelProtocol

public protocol SuperhumanCellViewModelProtocol {
    
    // MARK: - Properties
    
    /// Superhuman's name
    var name: String { get }
    
    /// Flag that indicates is this superhuman in favorite list
    var isFavorite: Bool { get set }
    
    /// Superhuman stats instance
    var stats: [SuperhumanStatPlainObject] { get }
    
    /// URL of image with superhuman
    var imageURL: URL { get }
    
    /// Background color of superhuman's card
    var backgroundColorHex: String { get }
}
