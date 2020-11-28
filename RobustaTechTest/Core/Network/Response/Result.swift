//
//  Result.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/27/20.
//

import Foundation

enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}
