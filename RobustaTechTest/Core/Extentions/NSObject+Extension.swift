//
//  NSObject+Extension.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/28/20.
//

import Foundation

extension NSObject {
    /// value that represent a className as string value
    static var className: String {
        return String(describing: self)
    }
}
