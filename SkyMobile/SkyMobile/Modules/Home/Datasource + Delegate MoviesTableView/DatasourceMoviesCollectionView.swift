//
//  DatasourceMoviesCollectionView.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import UIKit

class DatasourceMoviesCollectionView: NSObject, UICollectionViewDataSource {

    var movies: [MovieViewModel]?

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Home.CollectionView.CellIdentifier.movieCellIdentifier, for: indexPath) as! MovieCollectionViewCell
        cell.movieNameLabel.textColor = .white
        cell.movieNameLabel.text = movies?[indexPath.row].name
        cell.movieImage.image = UIImage(data: movies?[indexPath.row].urlImage ?? Data())
        return cell
    }
}
