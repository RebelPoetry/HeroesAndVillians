//
//  SuperhumanViewInput.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 24.11.2022.
//

import Foundation
import UIKit

// MARK: - SuperhumanViewInput

public protocol SuperhumanViewInput: AnyObject {

    /// Setup initial view state
    func setupInitialState()

    /// Select some superhuman
    /// - Parameter superhuman: some superhuman
    func selectSuperhuman(_ superhuman: SuperhumanPlainObject)
    
    /// Shows alert with error message
    func showErrorMessage(_ message: String)
}
