//
//  DelegateDetailMovieTableView.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import UIKit

class DelegateDetailMovieTableView: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return UIScreen.main.bounds.height * 0.35
        default:
            return UITableView.automaticDimension
        }
    }
}
