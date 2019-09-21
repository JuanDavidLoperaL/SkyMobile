//
//  HomePresenter.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import Foundation
protocol HomePresenterLogic {
    func displayLoading(bool: Bool)
    func presentMovies(movies: [MovieViewModel])
}

class HomePresenter: HomePresenterLogic {

    weak var vcDelegate: HomeViewControllerDisplayLogic?
    
    func displayLoading(bool: Bool) {
        vcDelegate?.displayLoading(bool: bool)
    }

    func presentMovies(movies: [MovieViewModel]) {
        vcDelegate?.displayMovies(movies: movies)
        vcDelegate?.displayLoading(bool: false)
    }
}
