//
//  RepositoriesUseCase.swift
//  RobustaTechTest
//
//  Created by mohamed gamal on 11/28/20.
//

import Foundation
class RepositoriesUseCase: APIClient {
    let session: URLSession
     init(configuration: URLSessionConfiguration) {
         self.session = URLSession(configuration: configuration)
     }
     convenience init() {
         self.init(configuration: .default)
     }
     //in the signature of the function in the success case we define the Class type thats is the generic one in the API
     func   getFeed(from userFeedType: RepositoriesFeed, completion: @escaping (Result<[Repositories], APIError>) -> Void) {
         let endpoint = userFeedType
         let request = endpoint.request
         fetch(with: request, decode: { json -> [Repositories]? in
             guard let repoFeedResult = json as? [Repositories] else { return  nil }
             return repoFeedResult
         }, completion: completion)
     }
 }
