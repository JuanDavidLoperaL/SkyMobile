//
//  MovieModel.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import Foundation

struct MovieModel: Decodable {
    var title: String
    var overview: String
    var duration: String
    var release_year: String
    var cover_url: String
    var backdrops_url: [String]
    var id: String
}
