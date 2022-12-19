//
//  SuperhumanViewController.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 09.10.2022.
//

import Foundation
import UIKit

// MARK: - SuperhumanViewController

public final class SuperhumanViewController: UIViewController {
    
    /// Presenter instance
    var output: SuperhumanViewOutput?

    /// Superhuman content manager
    var contentManager: SuperhumanContentManager?
    
    /// Name label of superhumans list
    private let listNameLabel = UILabel()
    
    /// Favorite button which on/off favorite superhumans filter
    private let favoriteButton: UIView = {
        
        let button = UIButton()
        button.setImage(UIImage(named: "unfilledStar") , for: .normal)
        return button
    }()
    
    /// Table view with superhuman cards
    private var tableView = UITableView()

    // MARK: - ViewController
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        contentManager = SuperhumanContentManagerImplementation(tableView: tableView, controllerFactory: SuperhumanCellControllerFactoryImplementation())
        output = SuperhumanPresenter(
            superhumanCellViewModelDesigner: SuperhumanCellViewModelDesignerImplementation(),
            superhumanViewInput: self
        )
        design()
        localize()
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

// MARK: - Localizable

public extension SuperhumanViewController {
    
    func localize() {
        listNameLabel.text = "Superheroes"
    }
}

// MARK: - Design

extension SuperhumanViewController {
    
    private func design() {
        listNameLabel.textColor = .white
        listNameLabel.font = .systemFont(ofSize: 32, weight: .bold)
        tableView.backgroundColor = .black
    }
}

// MARK: - SuperhumanViewInput

extension SuperhumanViewController: SuperhumanViewInput {
    
    public func setupInitialState() {
        setupTableView()
        setListNameLabel()
        setFavoriteButton()
    }
    
    public func update(_ viewModels: [SuperhumanCellViewModelProtocol]) {
        contentManager?.updateData(viewModels)
    }
    
    public func selectSuperhuman(_ superhuman: SuperhumanPlainObject) {
        // Conforming to protocol
    }
    
    public func showErrorMessage(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Layout

extension SuperhumanViewController {
    
    private func layoutTable() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInset = LayoutConstants.contentInsets
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
