//
//  SuperhumanViewController.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 09.10.2022.
//

import Foundation
import UIKit

// MARK: - SuperhumanViewController

final class SuperhumanViewController: UIViewController {
    
    /// Presenter instance
    var output: SuperhumanViewOutput?

    /// Superhuman content manager
    var contentManager: SuperhumanContentManager?
    
    /// List name instance
    private let listNameLabel: UILabel = {
        
        let name = UILabel()
        name.text = "Superheroes"
        name.textColor = .white
        name.font = .systemFont(ofSize: 32, weight: .bold)
        return name
    }()
    
    /// Favorite button instance
    private let favoriteButton: UIView = {
        
        let button = UIButton()
        button.setImage(UIImage(named: "unfilledStar") , for: .normal)
        return button
    }()
    
    /// Table view with superhuman cells
    private var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.contentInset = LayoutConstants.contentInsets
        return tableView
    }()

    // MARK: - ViewController
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        contentManager = SuperhumanContentManagerImplementation(tableView: tableView, controllerFactory: SuperhumanCellControllerFactoryImplementation())
        output = SuperhumanPresenter(
            superhumanCellViewModelDesigner: SuperhumanCellViewModelDesignerImplementation(),
            superhumanViewInput: self
        )
        design()
        output?.didTriggerViewReadyEvent()
    }
    
}

// MARK: - Layout

extension SuperhumanViewController {
    
    /// Setup table with superhumans cells
    private func setupTableView() {
        view.addSubview(tableView)
        layoutTable()
        contentManager?.configure(withContentView: tableView)
    }
}

// MARK: - Design

extension SuperhumanViewController {
    
    private func design() {
        tableView.backgroundColor = .black
        setListNameLabel()
        setFavoriteButton()
    }
}

// MARK: - SuperhumanViewInput

extension SuperhumanViewController: SuperhumanViewInput {
    
    public func setupInitialState() {
        setupTableView()
    }
    
    public func update(_ viewModels: [SuperhumanCellViewModelProtocol]) {
        contentManager?.updateData(viewModels)
    }
    
    public func selectSuperhuman(_ code: String) {
        //
    }
}

// MARK: - Layout

extension SuperhumanViewController {
    
    private func layoutTable() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: LayoutConstants.tableViewLeftPadding).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: LayoutConstants.tableViewRightPadding).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: LayoutConstants.tableViewTopPadding).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    private func setListNameLabel() {
        listNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listNameLabel)
        listNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        listNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: LayoutConstants.listNameLableTopPadding).isActive = true
    }
    private func setFavoriteButton() {
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(favoriteButton)
        favoriteButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        favoriteButton.topAnchor.constraint(equalTo: view.topAnchor, constant: LayoutConstants.favoriteButtonTopPadding).isActive = true
    }
}

// MARK: - Constants

extension SuperhumanViewController {
    
    enum LayoutConstants {
        static let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        static let tableViewLeftPadding: CGFloat = 8
        static let tableViewRightPadding: CGFloat = -8
        static let tableViewTopPadding: CGFloat = 96
        static let listNameLableTopPadding: CGFloat = 54
        static let favoriteButtonTopPadding: CGFloat = 48
    }
}
