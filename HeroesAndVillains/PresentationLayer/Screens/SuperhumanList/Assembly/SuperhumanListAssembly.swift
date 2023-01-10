//
//  SuperhumanListAssembly.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 09.01.2023.
//

import Foundation
import Swinject
import UIKit

// MARK: - SuperhumanListAssembly

final public class SuperhumanListAssembly: CollectableAssembly {
    
    // MARK: - Initializers

    required public init() {
    }

    // MARK: - Useful

    public func obtainViewController() -> SuperhumanViewController {
        container.resolve(SuperhumanViewController.self).unwrap()
    }

    // MARK: - Assembly

    public func assemble(inContainer container: Container) {
        
        container.register(SuperhumanViewController.self) { resolver in
            let controller = SuperhumanViewController()
            controller.output = resolver.resolve(SuperhumanViewOutput.self, argument: controller)
            return controller
        }
        
        container.register(SuperhumanViewOutput.self) { (resolver, view: SuperhumanViewController) in
            let interactor = resolver.resolve(SuperhumanInteractorInput.self).unwrap(as: SuperhumanInteractor.self)
            let presenter = SuperhumanPresenter(
                superhumanCellViewModelDesigner: resolver.resolve(SuperhumanCellViewModelDesigner.self).unwrap(),
                view: view as SuperhumanViewInput,
                contentManager: resolver.resolve(SuperhumanContentManager.self, argument: view).unwrap(),
                interactor: interactor)
            interactor.output = presenter
            return presenter
        }
        
        container.register(SuperhumanInteractorInput.self) { resolver in
            let interactor = SuperhumanInteractor(
                superhumanService: resolver.resolve(SuperhumanService.self).unwrap()
            )
            return interactor
        }
        
        container.register(SuperhumanCellControllerFactory.self) { _ in
            SuperhumanCellControllerFactoryImplementation()
        }

        container.register(SuperhumanCellViewModelDesigner.self) { _ in
            SuperhumanCellViewModelDesignerImplementation()
        }

        container.register(SuperhumanContentManager.self) { (resolver, controller: SuperhumanViewController) in
            let contentManager = SuperhumanContentManagerImplementation(
                controllerFactory: resolver.resolve(SuperhumanCellControllerFactory.self).unwrap()
            )
            contentManager.configure(withContentView: controller.tableView)
            return contentManager
        }
    }
}
