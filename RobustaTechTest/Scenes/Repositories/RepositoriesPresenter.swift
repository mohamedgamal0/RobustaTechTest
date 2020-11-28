//
//  RepositoriesPresenter.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/28/20.
//

import Foundation
class RepositoriesPresenter: BasePresenter<RepositoriesView> {
    
    var repoDetails: Repositories!
    
    override func viewDidAttach() {
        self.view.showDetails(repo: repoDetails)
    }
}
