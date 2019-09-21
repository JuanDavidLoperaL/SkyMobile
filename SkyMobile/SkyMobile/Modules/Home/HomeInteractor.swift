//
//  HomeInteractor.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import Foundation
protocol HomeInteractorBusinessLogic {
    func fetchMovies()
    func movieSelected(index: Int)
}

protocol HomeInteractorDataStore {
    var movieList: [MovieModel]? { get set }
    var movieSelect: MovieModel? { get set }
}

class HomeInteractor: HomeInteractorBusinessLogic, HomeInteractorDataStore {
    var presenter: HomePresenterLogic?
    var movieList: [MovieModel]?
    var movieSelect: MovieModel?

    lazy var worker: HomeWorker = HomeWorker()
    func fetchMovies() {
        presenter?.displayLoading(bool: true)
        worker.fetchMovies { [weak self] (result) in
            switch result {
            case .success(let movies):
                self?.caseControlMovies(movies: movies)
            case .failure(let genericError):
                print("")
            }
        }
    }

    func movieSelected(index: Int) {
        self.movieSelect = self.movieList?[index]
    }
}

extension HomeInteractor {
    private func transformInMoviesViewModel(movies: [MovieModel]) -> [MovieViewModel] {
        return movies.map({ (movieModel) -> MovieViewModel in
            let imgURL = URL(string: movieModel.cover_url)
            let imageData = try? Data(contentsOf: imgURL!)
            let movie = MovieViewModel(name: movieModel.title, urlImage: imageData ?? Data())
            return movie
        })
    }
    
    private func caseControlMovies(movies: [MovieModel]) {
        self.movieList = movies
        let moviesVM = transformInMoviesViewModel(movies: movies)
        presenter?.presentMovies(movies: moviesVM)
    }
}
