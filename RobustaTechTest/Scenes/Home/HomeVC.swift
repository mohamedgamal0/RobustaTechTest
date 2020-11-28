//
//  HomeVC.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/28/20.
//

import UIKit

protocol HomeView: BaseViewProtocol {
    func reloadTableView()
    func reloadTableView(at indexPaths: [IndexPath])
}
class HomeVC: BaseVC<HomeView, HomePresenter>, HomeView {
    
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    //MARK:- Life Cycle
    override func setupViews() {
        hideNavigationBar()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = .zero
        tableView.separatorStyle = .none
        tableView.register(cellType: RepositoriesCell.self)
    }
    //MARK:- HomeView Protocol
    func reloadTableView() {
        tableView.reloadData()
    }
    func reloadTableView(at indexPaths: [IndexPath]) {
        tableView.reloadRows(at: indexPaths, with: .fade)
    }
}
//MARK:- UITableViewDataSource
extension HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows(at: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoriesCell = tableView.dequeueReusableCell(for: indexPath)
        cell.delegate = self
        let repos = presenter.repositoriesData(at: indexPath)
        cell.configure(repo: repos, isExpanded: presenter.isCellExpanded(at: indexPath))
        return cell
    }
}
//MARK:- UITableViewDelegate
extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let args = presenter.repositoriesData(at: indexPath)
        let repositoriesVC: RepositoriesVC = Resolver.resolve(args: args)
        self.presentVC(repositoriesVC)

    }
}
//MARK:- RepositoriesCellDelegate
extension HomeVC: RepositoriesCellDelegate {
    func repoCellArrowTapped(cell: RepositoriesCell) {
        if let indexpath = tableView.indexPath(for: cell) {
            presenter.cellArrowTapped(at: indexpath)
        }
    }
}
