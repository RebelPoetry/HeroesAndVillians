//
//  SuperhumanContentManagerImplementation.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 22.11.2022.
//

import Foundation
import UIKit
import SDAO
import VIPER

// MARK: - SuperhumanContentManagerImplementation

public final class SuperhumanContentManagerImplementation: IntermediateContentManager<UITableView> {

    // MARK: - Properties

    /// Superhuman controllers factory
    private let controllersFactory: SuperhumanCellControllerFactory

    /// Current controllers which manipulates tableView's cells
    private var controllers: [SuperhumanCellController] = []
    
    /// Table view instance
    private let tableView: UITableView

    // MARK: - Initializers
    
    /// Default initializer
    ///
    /// - Parameters:
    ///    - presentersFactory: superhuman presenters factory
    ///    - tableView: table view with superhuman's
    public init(tableView: UITableView, controllerFactory: SuperhumanCellControllerFactory) {
        self.tableView = tableView
        self.controllersFactory = controllerFactory
        super.init()
        configure(withContentView: self.tableView)
    }
}

// MARK: - SuperhumanContentManager

extension SuperhumanContentManagerImplementation: SuperhumanContentManager {
    
    public func selectSuperhuman(_ superhumanID: SDAO.UniqueID) {
        //
    }
    
    public func updateData(_ viewModels: [SuperhumanCellViewModelProtocol]) {
        guard let tableView = contentView else { return }
        controllers = controllersFactory.controllers(with: viewModels, tableView: tableView)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension SuperhumanContentManagerImplementation: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        controllers[indexPath.row].cellSize(reusableCellHolder: tableView).height
    }
}

// MARK: - UITableViewDataSource

extension SuperhumanContentManagerImplementation: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        controllers.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = controllers[indexPath.row].cellFromReusableCellHolder(tableView, forIndexPath: indexPath) as? SuperhumanCell
        cell?.selectionStyle = .none
        return cell.unwrap()
    }
}
