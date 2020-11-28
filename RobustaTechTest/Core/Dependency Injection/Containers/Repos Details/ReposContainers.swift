//
//  ReposContainers.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/28/20.
//

import Foundation
extension Resolver {
    static func registerReposContainers() {
        register { RepositoriesVC() }
        register { (_, args) -> RepositoriesVC in
            let view = RepositoriesVC()
            view.presenterArgs = args
            return view
        }
        
        register { (_, args) -> RepositoriesPresenter in
            let presenter = RepositoriesPresenter()
            presenter.repoDetails = args as? Repositories
            return presenter
        }
    }
}
