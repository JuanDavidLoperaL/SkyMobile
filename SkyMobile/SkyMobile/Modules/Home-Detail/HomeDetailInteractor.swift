//
//  HomeDetailInteractor.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import Foundation

protocol HomeDetailInteractorBusinessLogic {
    func transformMovie(movie: MovieModel?)
}

class HomeDetailInteractor: HomeDetailInteractorBusinessLogic {
    var presenter: HomeDetailPresenterLogic?

    func transformMovie(movie: MovieModel?) {
        presenter?.displayLoading(bool: true)
        guard let movie = movie else {
            return
        }
        let imgURL = URL(string: movie.cover_url)
        let imageData = try? Data(contentsOf: imgURL!)
        let detailMovie = MovieDetailViewModel(urlImage: imageData ?? Data(), name: movie.title, duration: movie.duration, releaseYear: movie.release_year, overView: movie.overview)
        presenter?.presentMovie(movie: detailMovie)
    }
}
