//
//  UIView+Extensions.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/28/20.
//

import UIKit
extension UIView {
    func makeCircular() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.clipsToBounds = true
    }
}
