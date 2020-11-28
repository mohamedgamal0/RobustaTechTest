//
//  BaseVC.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/28/20.
//

import Foundation
import UIKit

protocol BaseViewProtocol: AnyObject {
    func showLoader()
    func hideLoader()
}


class BaseVC<ViewProtocol, Presenter>: UIViewController, BaseViewProtocol where Presenter: BasePresenter<ViewProtocol> {
    
    open var presenterArgs: Any?
    
    lazy var presenter: Presenter = {
        let presenter: Presenter = Resolver.resolve(args: presenterArgs)
        presenterArgs = nil
        return presenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let view = self as? ViewProtocol else {
            fatalError("Presenter of type \(Presenter.Type.self) need to attach View of type \(ViewProtocol.Type.self)")
        }
        presenter.attach(view: view)
        setupViews()
    }
    open func setupViews() {}
    
    func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func presentVC(_ viewController: UIViewController, completion: (() -> Void)? = nil) {
        present(viewController, animated: true, completion: completion)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.viewDidDisappear()
    }
    
    
    func showLoader() {
        animateLoader()
        
    }
    
    func hideLoader() {
        stopLoader()
    }
    
}
