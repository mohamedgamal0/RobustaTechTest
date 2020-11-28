//
//  HomeContainers.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/28/20.
//

import Foundation

extension Resolver {
    static func registerHomeContainers() {
        register { RepositoriesUseCase() }
        register { HomeVC() }
        register { HomePresenter() }
    }
}
