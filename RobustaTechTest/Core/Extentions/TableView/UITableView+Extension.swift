//
//  UITableView+Extension.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/28/20.
//

import Foundation

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(cellType: T.Type) {
        let nib = UINib(nibName: cellType.className, bundle: nil)
        self.register(nib, forCellReuseIdentifier: cellType.className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T? {
        let cell = self.dequeueReusableCell(withIdentifier: T.className)
        return cell as? T
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let cell = self.dequeueReusableCell(withIdentifier: T.className, for: indexPath)
        return cell as! T
    }
}

extension UITableViewCell {
    open override func awakeFromNib() {
        setupViews()
    }
    @objc func setupViews() {}
}
