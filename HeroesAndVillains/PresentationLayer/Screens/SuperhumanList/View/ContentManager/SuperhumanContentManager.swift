//
//  SuperhumanContentManager.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 17.11.2022.
//

import Foundation
import SDAO
import VIPER

// MARK: - SuperhumanContentManager

public protocol SuperhumanContentManager: GeneralContentManager {

    /// Update table's data using some new viewModels
    ///
    /// - Parameter viewModels: new data
    func updateData(_ viewModels: [SuperhumanCellViewModelProtocol])

    /// Select some country code
    /// - Parameter code: some country code
    func selectSuperhuman(_ superhumanID: UniqueID)
}
