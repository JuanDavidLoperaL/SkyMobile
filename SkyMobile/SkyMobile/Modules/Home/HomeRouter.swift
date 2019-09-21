//
//  HomeRouter.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import UIKit

@objc protocol HomeRouterLogic {
    func showDetailView()
}

protocol HomeRouterDataPassing {
    var dataStore: HomeInteractorDataStore? { get }
}
class HomeRouter: NSObject, HomeRouterLogic, HomeRouterDataPassing {

    var dataStore: HomeInteractorDataStore?
    weak var homeVC: HomeViewController?
    
    func showDetailView() {
        homeVC?.performSegue(withIdentifier: Constants.Segue.homeToHomeDetail, sender: dataStore?.movieSelect)
    }
}
