//
//  SuperhumanInteractor.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 24.11.2022.
//

import Foundation

// MARK: - SuperhumanInteractor

final public class SuperhumanInteractor {

    // MARK: - Properties

    /// Presenter instance
    weak var output: SuperhumanInteractorOutput?

    /// SuperhumanService instance
    private let superhumanService: SuperhumanService

    // MARK: - Initializers
    
    /// Default initializer
    ///
    /// - Parameters:
    ///    - superhumanService: service instance
    ///    - superhumanPresenter: presenter instance
    public init(superhumanService: SuperhumanService, superhumanPresenter: SuperhumanInteractorOutput) {
        self.superhumanService = superhumanService
        self.output = superhumanPresenter
    }
}

// MARK: - SuperhumanInteractorInput

extension SuperhumanInteractor: SuperhumanInteractorInput {

    public func obtainSuperhumans() {
        superhumanService
            .obtain()
            .async()
            .success(output?.obtainSuperhumansSuccess)
            .failure(output?.processError)
    }
}
