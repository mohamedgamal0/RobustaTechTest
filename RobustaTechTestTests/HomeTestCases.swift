//
//  HomeTestCases.swift
//  RobustaTechTestTests
//
//  Created by mohamed gamal on 11/29/20.
//


import XCTest

@testable import RobustaTechTest

class HomeTestCases: XCTestCase {
    func testHomePresenter() {
        let homePresenter = HomePresenter()
        XCTAssertTrue((homePresenter.numberOfSections() == 1))
        XCTAssertNotNil(homePresenter.repositories)
        XCTAssertTrue(homePresenter.numberOfRows(at: 1) == homePresenter.repositories.count)
        XCTAssertFalse(homePresenter.isCellExpanded(at: IndexPath(row: 0, section: 1)))
    }
    
    func jesonTest() {
        let data = dataFrom(filename: "Repositories")
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let repo = try! decoder.decode(Repositories.self, from: data)
        XCTAssertNotNil(repo.owner)
        XCTAssertNotNil(repo.id)
        XCTAssertNotNil(repo.name)
        XCTAssertNotNil(repo.description)
        XCTAssertNotNil(repo.owner?.avatarURL)
    }
}

extension XCTestCase {
    func dataFrom(filename: String) -> Data {
        let path = Bundle(for: HomeTestCases.self).path(forResource: filename, ofType: "json")!
        return NSData(contentsOfFile: path)! as Data
    }
}
