//
//  DatasourceDetailMovieTableView.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import UIKit

class DatasourceDetailMovieTableView: NSObject, UITableViewDataSource {
    var movie: MovieDetailViewModel?

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.HomeDetail.TableView.CellIdentifier.detailMovieCellIdentifier, for: indexPath) as! DetailMovieTableViewCell
            cell.movieImage.image = UIImage(data: movie?.urlImage ?? Data())
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "defaultMovieDetailCell")
            cell.textLabel?.text = "Movie name: \(movie?.name ?? "")"
            cell.textLabel?.textColor = .white
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "defaultMovieDetailCell")
            cell.textLabel?.text = "Duration: \(movie?.duration ?? "")"
            cell.textLabel?.textColor = .white
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "defaultMovieDetailCell")
            cell.textLabel?.text = "Release year: \(movie?.releaseYear ?? "")"
            cell.textLabel?.textColor = .white
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        default:
            let cell = UITableViewCell(style: .value1, reuseIdentifier: "defaultMovieDetailCell")
            cell.textLabel?.text = movie?.overView
            cell.textLabel?.textColor = .white
            cell.textLabel?.numberOfLines = 0
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
    }
}
