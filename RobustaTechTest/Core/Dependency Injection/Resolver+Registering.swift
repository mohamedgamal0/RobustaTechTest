//
//  Resolver+Registering.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/28/20.
//

import Foundation
extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        registerHomeContainers()
        registerReposContainers()
    }
}
