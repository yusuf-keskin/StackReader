//
//  MainCoordinator.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 15.09.2022.
//

import Foundation
import UIKit

enum Navigate {
    case launchVC
    case questionVC
    case detailsVC
}

class MainCoordinator : Coordinator {
    var childCoordinators = [Coordinator] ()
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LaunchVC.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func buySubscription () {
//        let vc = BuyViewController.instantiate()
//        vc.coordinator= self
//        navigationController.pushViewController(vc, animated: false)
    }
 
    func navitage(coordinatorTo nav: Navigate) {
        switch nav {
        case .launchVC :
            let vc = LaunchVC.instantiate()
            vc.coordinator = self
            navigationController.pushViewController(vc, animated: false)
        case .questionVC:
            let vc = QuestionListVC.instantiate()
            vc.coordinator = self
            navigationController.isNavigationBarHidden = true
            navigationController.pushViewController(vc, animated: false)
        case .detailsVC:
            let vc = DetailsVC.instantiate()
            vc.coordinator = self
            navigationController.pushViewController(vc, animated: false)
        }
    }
    
}

