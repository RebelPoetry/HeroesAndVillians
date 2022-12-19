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

    /// SuperhumanCellViewModelProtocol factory
    private let superhumanCellViewModelDesigner: SuperhumanCellViewModelDesigner

    /// Interactor instance
    var interactor: SuperhumanInteractorInput?

    /// Router instance
    var router: SuperhumanRouterInput?

    // MARK: - Initializers

    /// Default initializer
    ///
    /// - Parameter SuperhumanCellViewModelDesigner: SuperhumanCellViewModelProtocol factory
    public init(
        superhumanCellViewModelDesigner: SuperhumanCellViewModelDesigner,
        superhumanViewInput: SuperhumanViewInput
    ) {
        self.superhumanCellViewModelDesigner = superhumanCellViewModelDesigner
        self.view = superhumanViewInput
        self.interactor = SuperhumanInteractor(superhumanService: SuperumanServiceImplementation(), superhumanPresenter: self)
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
        view?.update(viewModels)
    }
}

// MARK: - SuperhumanModuleInput

extension SuperhumanPresenter: SuperhumanModuleInput {

    public func setModuleOutput(_ moduleOutput: ModuleOutput) {
        self.output = moduleOutput as? SuperhumanModuleOutput
    }
}
