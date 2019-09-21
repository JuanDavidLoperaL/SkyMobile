//
//  HomeDetailViewController.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import UIKit
protocol HomeDetailViewControllerDisplayLogic: class {
    func displayLoading(bool: Bool)
    func displayMovieDetail(movie: MovieDetailViewModel)
}
class HomeDetailViewController: UIViewController {


    //MARK:- IBOutlet
    @IBOutlet weak var detailMovieTableView: UITableView!
    

    //MARK:- Properties
    var datasourceDetailMovie = DatasourceDetailMovieTableView()
    var delegateDetailMovie = DelegateDetailMovieTableView()

    var detailMovieNib: UINib?

    var interactor: HomeDetailInteractorBusinessLogic?
    var movie: MovieModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        configureUI()
        interactor?.transformMovie(movie: movie)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = .black
    }

}

extension HomeDetailViewController {

    private func setupDelegates() {
        let viewController = self
        let presenter = HomeDetailPresenter()
        let interactor = HomeDetailInteractor()

        viewController.interactor = interactor
        presenter.vcDelegate = viewController
        interactor.presenter = presenter

        detailMovieTableView.dataSource = datasourceDetailMovie
        detailMovieTableView.delegate = delegateDetailMovie
    }

    private func configureUI() {
        detailMovieTableView.tableFooterView = UIView()
        detailMovieTableView.estimatedRowHeight = UIScreen.main.bounds.height * 0.35
        detailMovieTableView.rowHeight = UITableView.automaticDimension
        registerCell()
    }

    private func registerCell() {
        detailMovieNib = UINib(nibName: Constants.HomeDetail.TableView.NIB.detailMovieNib, bundle: nil)
        detailMovieTableView.register(detailMovieNib, forCellReuseIdentifier: Constants.HomeDetail.TableView.CellIdentifier.detailMovieCellIdentifier)
    }
}

extension HomeDetailViewController: HomeDetailViewControllerDisplayLogic {
    func displayLoading(bool: Bool) {
        
    }

    func displayMovieDetail(movie: MovieDetailViewModel) {
        DispatchQueue.main.async {
            self.datasourceDetailMovie.movie = movie
            self.detailMovieTableView.reloadData()
        }
    }
}
