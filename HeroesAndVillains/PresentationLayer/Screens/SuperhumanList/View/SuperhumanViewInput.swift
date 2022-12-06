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
    /// - Parameter superhumanName: some superhuman's name
    func selectSuperhuman(_ superhumanName: String)
}
