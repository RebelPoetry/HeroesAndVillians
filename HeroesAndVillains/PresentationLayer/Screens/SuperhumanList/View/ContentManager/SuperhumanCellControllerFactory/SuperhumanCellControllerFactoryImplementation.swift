//
//  SuperhumanCellControllerFactoryImplementation.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 17.11.2022.
//

import Foundation
import UIKit

final public class SuperhumanCellControllerFactoryImplementation {
    
}

// MARK: - CountryCodeCellControllerFactory

extension SuperhumanCellControllerFactoryImplementation: SuperhumanCellControllerFactory {

    public func controller(with viewModel: SuperhumanCellViewModelProtocol, tableView: UITableView) -> SuperhumanCellController {
        SuperhumanCellController.registerCell(on: tableView)
        return SuperhumanCellController(viewModel: viewModel)
    }
}
