//
//  SuperhumanCellViewModelDesignerImplementation.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 24.11.2022.
//

import Foundation

// MARK: - SuperhumanCellViewModelDesignerImplementation

final public class SuperhumanCellViewModelDesignerImplementation {

    // MARK: - Properties
}

// MARK: - SuperhumanViewModelDesigner

extension SuperhumanCellViewModelDesignerImplementation: SuperhumanCellViewModelDesigner {

    public func viewModel(from superhuman: SuperhumanPlainObject) -> SuperhumanCellViewModelProtocol {
        SuperhumanCellViewModel(superhuman: superhuman)
    }
}
