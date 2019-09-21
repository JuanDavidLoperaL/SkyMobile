//
//  SkyMobileTests.swift
//  SkyMobileTests
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import XCTest
@testable import SkyMobile

class SkyMobileTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidCallToSkyMovies() {
        let defaultSession = URLSession(configuration: .default)
        let url = URL(string: "https://sky-exercise.herokuapp.com/api/Movies")
        let promise = expectation(description: "Status code received: 200")
        let dataTask = defaultSession.dataTask(with: url!) { data, response, error in

            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code received: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        wait(for: [promise], timeout: 10)
    }

    func testValidateDataTransform() {
        let movies = [MovieModel(title: "Movie1", overview: "", duration: "", release_year: "", cover_url: "", backdrops_url: [""], id: ""), MovieModel(title: "Movie2", overview: "", duration: "", release_year: "", cover_url: "", backdrops_url: [""], id: ""), MovieModel(title: "Movie3", overview: "", duration: "", release_year: "", cover_url: "", backdrops_url: [""], id: "")]
        let homeInteractor = HomeInteractor()
        let moviesVM = homeInteractor.transformInMoviesViewModel(movies: movies)
        XCTAssert(moviesVM is [MovieViewModel], "Our tranform data is working well")
    }

    func testValidateNegativeDataTransform() {
        let movies = [MovieModel(title: "Movie1", overview: "", duration: "", release_year: "", cover_url: "", backdrops_url: [""], id: ""), MovieModel(title: "Movie2", overview: "", duration: "", release_year: "", cover_url: "", backdrops_url: [""], id: ""), MovieModel(title: "Movie3", overview: "", duration: "", release_year: "", cover_url: "", backdrops_url: [""], id: "")]
        let homeInteractor = HomeInteractor()
        let moviesVM = homeInteractor.transformInMoviesViewModel(movies: movies)
        XCTAssertFalse(moviesVM is [MovieDetailViewModel], "Our tranform data is working well")
    }
}
