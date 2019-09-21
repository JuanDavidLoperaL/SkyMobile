//
//  HomeDetailPresenter.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import Foundation
protocol HomeDetailPresenterLogic {
    func displayLoading(bool: Bool)
    func presentMovie(movie: MovieDetailViewModel)
}

class HomeDetailPresenter: HomeDetailPresenterLogic {
    weak var vcDelegate: HomeDetailViewControllerDisplayLogic?
    func displayLoading(bool: Bool) {
        vcDelegate?.displayLoading(bool: bool)
    }

    func presentMovie(movie: MovieDetailViewModel) {
        vcDelegate?.displayMovieDetail(movie: movie)
        vcDelegate?.displayLoading(bool: false)
    }
}
