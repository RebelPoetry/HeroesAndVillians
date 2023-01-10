//
//  HeroesAndVilliansAssembliesCollector.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 05.01.2023.
//

import Foundation
import Swinject

// MARK: - HeroesAndVillainsAssembliesCollector

final class HeroesAndVillainsAssembliesCollector: AssembliesCollector {
    
    func collect(inContainer container: Container) {
        
        let typeCount = Int(objc_getClassList(nil, 0))
        let types = UnsafeMutablePointer<AnyClass?>.allocate(capacity: typeCount)
        let autoreleasingTypes = AutoreleasingUnsafeMutablePointer<AnyClass>(types)
        
        objc_getClassList(autoreleasingTypes, Int32(typeCount))
        
        let priorityAssemblies: [CollectableAssembly.Type] = [
        ]
        
        priorityAssemblies.forEach {
            $0.init().assemble(inContainer: container)
        }
        
        for index in 0..<typeCount {
            if let assemblyType = (types[index] as? CollectableAssembly.Type) {
                let object = assemblyType.init()
                object.assemble(inContainer: container)
            }
        }
        
        types.deallocate()
    }
}

