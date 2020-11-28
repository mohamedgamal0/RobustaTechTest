//
//  RepositoriesVC.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/28/20.
//

import UIKit

protocol RepositoriesView: BaseViewProtocol {
    func showDetails(repo: Repositories)
}
class RepositoriesVC: BaseVC<RepositoriesView, RepositoriesPresenter>, RepositoriesView {
    //MARK: OutLets
    @IBOutlet weak var repoImage: UIImageView!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    //MARK: - Life Cyacle
    override func setupViews() {
        repoImage.makeCircular()
    }
    //MARK:- RepositoriesView
    func showDetails(repo: Repositories) {
        let url = URL(string: repo.owner?.avatarURL ?? "")
        self.repoImage.downloadImage(from: url!)
        self.repoNameLabel.text = repo.name ?? ""
        self.descriptionLabel.text = repo.description ?? ""
    }
}
