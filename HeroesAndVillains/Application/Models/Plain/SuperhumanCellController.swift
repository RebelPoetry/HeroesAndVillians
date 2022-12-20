//
//  SuperhumanCellController.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 17.11.2022.
//

import Foundation
import GenericCellPresenters

// MARK: - SuperhumanCellController

final public class SuperhumanCellController: GenericCellPresenter<SuperhumanCell> {
    
    // MARK: - Properties
    
    /// ViewModel instance
    public let viewModel: SuperhumanCellViewModelProtocol
    
    // MARK: - Initializers
    
    /// Default initializer
    ///
    /// - Parameter viewModel: ViewModel instance
    public init(viewModel: SuperhumanCellViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    // MARK: - CellController
    
    override public func configureCell(_ cell: SuperhumanCell) {
        cell.setup(with: viewModel)
    }
    
    override public func cellSize(reusableCellHolder: UITableView) -> CGSize {
        CGSize(width: reusableCellHolder.frame.width, height: 208)
    }
}
