//
//  SuperhumanCellViewModelDesigner.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 24.11.2022.
//

import Foundation

// MARK: - SuperhumanCellViewModelDesigner

public protocol SuperhumanCellViewModelDesigner {

    /// Converts SuperhumanPlainObject to SuperhumanCellViewModelProtocol
    /// - Parameter superhuman: some superhuman
    func viewModel(from superhuman: SuperhumanPlainObject) -> SuperhumanCellViewModelProtocol
}

public extension SuperhumanCellViewModelDesigner {

    func viewModels(from superhumans: [SuperhumanPlainObject]) -> [SuperhumanCellViewModelProtocol] {
        superhumans.map(viewModel)
    }
}
