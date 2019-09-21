//
//  HomeViewController.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import UIKit

protocol HomeViewControllerDisplayLogic: class {
    func displayLoading(bool: Bool)
    func displayMovies(movies: [MovieViewModel])
}

class HomeViewController: UIViewController {


    //MARK:- IBOutlet
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var cinemaTitle: UILabel!
    @IBOutlet weak var overlayLoadingView: UIView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cinemaDescriptionLabel: UILabel!
    

    //MARK:- Properties
    var datasourceMoviesCollectionView = DatasourceMoviesCollectionView()
    var delegateMoviesCollectionView = DelegateMoviesCollectionView()

    var interactor: HomeInteractorBusinessLogic?
    var router: (NSObjectProtocol & HomeRouterLogic & HomeRouterDataPassing)?

    var movieNib: UINib?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        configureUI()
        interactor?.fetchMovies()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segue.homeToHomeDetail {
            if let homeDetailVC = segue.destination as? HomeDetailViewController {
                homeDetailVC.movie = sender as? MovieModel
            }
        }
    }
}

extension HomeViewController {

    private func setupDelegates() {
        let viewController = self
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()

        viewController.interactor = interactor
        viewController.router = router
        presenter.vcDelegate = viewController
        interactor.presenter = presenter
        router.dataStore = interactor
        router.homeVC = viewController

        delegateMoviesCollectionView.delegate =  self
        moviesCollectionView.dataSource = datasourceMoviesCollectionView
        moviesCollectionView.delegate = delegateMoviesCollectionView
    }

    private func configureUI() {
        cinemaTitle.text = "Cine SKY"
        cinemaTitle.textColor = .white
        cinemaTitle.font = UIFont.boldSystemFont(ofSize: 24)
        cinemaDescriptionLabel.text = "Uma seleção de filmes imperdives:"
        cinemaDescriptionLabel.textColor = .white
        loadingLabel.text = "Carregando filmes"
        loadingLabel.textColor = .white
        registerCell()
    }

    private func registerCell() {
        movieNib = UINib(nibName: Constants.Home.CollectionView.NIB.movieCellNib, bundle: nil)
        moviesCollectionView.register(movieNib, forCellWithReuseIdentifier: Constants.Home.CollectionView.CellIdentifier.movieCellIdentifier)
    }
}

extension HomeViewController: HomeViewControllerDisplayLogic {
    func displayLoading(bool: Bool) {
        DispatchQueue.main.async {
            self.overlayLoadingView.backgroundColor = .black
            self.activityIndicator.color = .white
            self.activityIndicator.backgroundColor = .clear
            switch bool {
            case true:
                self.overlayLoadingView.isHidden = false
                self.activityIndicator.isHidden = false
                self.activityIndicator.startAnimating()
            case false:
                self.overlayLoadingView.isHidden = true
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
            }
        }

    }

    func displayMovies(movies: [MovieViewModel]) {
        datasourceMoviesCollectionView.movies = movies
        DispatchQueue.main.async {
            self.moviesCollectionView.reloadData()
        }
    }
}

extension HomeViewController: DelegateMoviesCollectionViewProtocol {
    func movieSelected(index: Int) {
        interactor?.movieSelected(index: index)
        router?.showDetailView()
    }
}
