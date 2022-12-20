//
//  SuperhumanViewOutput.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 24.11.2022.
//

import Foundation

// MARK: - SuperhumanViewOutput

public protocol SuperhumanViewOutput {

    /// View is ready
    func didTriggerViewReadyEvent()

    /// Some superhuman was selected
    /// - Parameter superhumanName: some superhuman
    func didTriggerSelectSuperhumanEvent(_ superhuman: SuperhumanPlainObject)
}
