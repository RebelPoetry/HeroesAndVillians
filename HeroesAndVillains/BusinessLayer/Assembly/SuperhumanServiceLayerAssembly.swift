//
//  SuperhumanServiceLayerAssembly.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 09.01.2023.
//

import Swinject

// MARK: - SuperhumanServiceLayerAssembly

final public class SuperhumanServiceLayerAssembly: CollectableAssembly {
    
    // MARK: - Initializers
    
    required public init() {
    }
    
    // MARK: - CollectableAssembly
    
    public func assemble(inContainer container: Container) {
        
        container.register(SuperhumanService.self) { _ in
            SuperhumanServiceImplementation()
        }
    }
}
