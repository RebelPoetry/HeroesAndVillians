//
//  SuperhumanListModule.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 09.01.2023.
//

import Foundation
import TransitionHandler

// MARK: - SuperhumanListModule

public final class SuperhumanListModule {
    
    
    // MARK: - Aliases
    
    public typealias View = SuperhumanViewController
    public typealias Input = SuperhumanModuleInput
    
    
    // MARK: - Module
    
    public static func instantiate() -> View {
        SuperhumanListAssembly().obtainViewController()
    }
}
