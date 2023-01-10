//
//  SuperumanServiceImplementation.swift
//  HeroesAndVillains
//
//  Created by Kazakh on 15.11.2022.
//

import Foundation
import ServiceCore

// MARK: - SuperhumanServiceImplementation

public final class SuperhumanServiceImplementation: Service {
}

// MARK: - SuperhumanService

extension SuperhumanServiceImplementation: SuperhumanService {
    
    public func obtain() -> ServiceCall<[SuperhumanPlainObject]> {
        createCall {
            guard let fileUrl = Bundle.main.url(forResource: "SuperhumansInfo", withExtension: "json") else {
                let error = NSError(domain: "com.superhumans.app", code: 404, userInfo: [NSLocalizedDescriptionKey : "Object with data does not exist"])
                return .failure(error)
            }
            let data = try Data(contentsOf: fileUrl)
            let plains = try data.jsonDecoded() as [SuperhumanPlainObject]
            return .success(plains)
        }
    }
}
