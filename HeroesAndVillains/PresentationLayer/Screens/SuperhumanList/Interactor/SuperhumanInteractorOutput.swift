//
//  SuperhumanInteractorOutput.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 24.11.2022.
//

import VIPER

// MARK: - SuperhumanInteractorOutput

public protocol SuperhumanInteractorOutput: InteractorOutput {

    /// Superhumans was successfully obtained
    /// - Parameter superhumans: obtained superhumans
    func obtainSuperhumansSuccess(_ superhumans: [SuperhumanPlainObject])
}
