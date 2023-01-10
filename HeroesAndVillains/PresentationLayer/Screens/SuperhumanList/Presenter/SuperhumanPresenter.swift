//
//  SuperhumanPresenter.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 24.11.2022.
//

import Foundation
import TransitionHandler

// MARK: - SuperhumanPresenter

final public class SuperhumanPresenter {

    // MARK: - Properties

    /// SuperhumanModuleOutput instance
    weak var output: SuperhumanModuleOutput?

    /// View instance
    weak var view: SuperhumanViewInput?

    /// Superhuman content manager
    private var contentManager: SuperhumanContentManager?
    
    /// SuperhumanCellViewModelProtocol factory
    private let superhumanCellViewModelDesigner: SuperhumanCellViewModelDesigner

    /// Interactor instance
    private var interactor: SuperhumanInteractorInput?

    /// Router instance
    var router: SuperhumanRouterInput?

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameter SuperhumanCellViewModelDesigner: SuperhumanCellViewModelProtocol factory
    public init(
        superhumanCellViewModelDesigner: SuperhumanCellViewModelDesigner,
        view: SuperhumanViewInput,
        contentManager: SuperhumanContentManager,
        interactor: SuperhumanInteractor
    ) {
        self.view = view
        self.contentManager = contentManager
        self.superhumanCellViewModelDesigner = superhumanCellViewModelDesigner
        self.interactor = interactor
    }
}

// MARK: - SuperhumanViewOutput

extension SuperhumanPresenter: SuperhumanViewOutput {
    
    public func didTriggerSelectSuperhumanEvent(_ superhuman: SuperhumanPlainObject) {
        // Conforming to protocol
    }

    public func didTriggerViewReadyEvent() {
        view?.setupInitialState()
        interactor?.obtainSuperhumans()
    }
}

// MARK: - CountryCodeInteractorOutput

extension SuperhumanPresenter: SuperhumanInteractorOutput {

    public func processErrorMessage(_ errorMessage: String) {
        view?.showErrorMessage(errorMessage)
    }

    public func obtainSuperhumansSuccess(_ codes: [SuperhumanPlainObject]) {
        let viewModels = superhumanCellViewModelDesigner.viewModels(from: codes)
        contentManager?.updateData(viewModels)
    }
}

// MARK: - SuperhumanModuleInput

extension SuperhumanPresenter: SuperhumanModuleInput {

    public func setModuleOutput(_ moduleOutput: ModuleOutput) {
        self.output = moduleOutput as? SuperhumanModuleOutput
    }
}
