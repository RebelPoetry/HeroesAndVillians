//
//  SuperhumanService.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 15.11.2022.
//

import Foundation
import ServiceCore

// MARK: - SuperhumanService
public protocol SuperhumanService {
    
    /// Obtain all superhumans
    func obtain() -> ServiceCall<[SuperhumanPlainObject]>
}
