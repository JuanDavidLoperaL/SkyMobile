//
//  HomeRouter.swift
//  SkyMobile
//
//  Created by Juan David Lopera Lopez on 9/20/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import UIKit

@objc protocol HomeRouterLogic {
    func showDetailView(segue: UIStoryboardSegue?)
}

protocol HomeRouterDataPassing {
    var dataStore: HomeInteractorDataStore? { get }
}
class HomeRouter: NSObject, HomeRouterLogic, HomeRouterDataPassing {

    var dataStore: HomeInteractorDataStore?
    weak var homeVC: HomeViewController?
    
    func showDetailView(segue: UIStoryboardSegue?) {
        
    }
}
