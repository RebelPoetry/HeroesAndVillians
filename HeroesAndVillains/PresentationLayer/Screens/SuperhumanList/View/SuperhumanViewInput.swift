//
//  SuperhumanViewInput.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 24.11.2022.
//

import Foundation

// MARK: - SuperhumanViewInput

public protocol SuperhumanViewInput: AnyObject {

    /// Setup initial view state
    func setupInitialState()

    /// Update data
    ///
    /// - Parameter viewModels: new data for UITableView instance
    func update(_ viewModels: [SuperhumanCellViewModelProtocol])

    /// Select some superhuman
    /// - Parameter superhuman: some superhuman
    func selectSuperhuman(_ superhuman: SuperhumanPlainObject)
}
