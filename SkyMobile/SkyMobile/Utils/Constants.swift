//
//  Constants.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import Foundation

struct Constants {
    struct Segue {
        static let homeToHomeDetail = "homeToHomeDetail"
    }
    struct Home {
        struct CollectionView {
            struct CellIdentifier {
                static let movieCellIdentifier = "movieCell"
            }

            struct NIB {
                static let movieCellNib = "MovieCollectionViewCell"
            }
        }
    }

    struct HomeDetail {
        struct TableView {
            struct CellIdentifier {
                static let detailMovieCellIdentifier = "detailMovieCell"
            }

            struct NIB {
                static let detailMovieNib = "DetailMovieTableViewCell"
            }
        }
    }
}
