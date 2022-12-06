//
//  SuperhumanCellControllerFactory.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 17.11.2022.
//

import Foundation
import UIKit

// MARK: - SuperhumanCelControllerFactory

public protocol SuperhumanCellControllerFactory {

    /// Create SuperhumanCellController instance using some
    /// viewModel and register it to the given tableView
    ///
    /// - Parameters:
    ///   - viewModel: viewModel instance for cell's configuration
    ///   - tableView: tableView for registering cell
    /// - Returns: SuperhumanCellController instance
    func controller(with viewModel: SuperhumanCellViewModelProtocol, tableView: UITableView) -> SuperhumanCellController
}

public extension SuperhumanCellControllerFactory {

    /// Create SuperhumanCellController array using some
    /// viewModels and register it to the given tableView
    ///
    /// - Parameters:
    ///   - viewModels: viewModels instances for cells configuration
    ///   - tableView: tableView for registering cells
    /// - Returns: SuperhumanCellController array
    func controllers(with viewModels: [SuperhumanCellViewModelProtocol], tableView: UITableView) -> [SuperhumanCellController] {
        viewModels.map {
            controller(with: $0, tableView: tableView)
        }
    }
}
