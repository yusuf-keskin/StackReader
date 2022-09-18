//
//  LaunchVC.swift
//  StackReader
//
//  Created by YUSUF KESKİN on 15.09.2022.
//

import UIKit

class LaunchVC: UIViewController, Storyboarded {
    
    
    @IBOutlet weak var launchTitle: UILabel!
    
    weak var coordinator : MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        animateAndGo(view: launchTitle, delay: 0)
    }
    
    func animateAndGo(view : UIView, delay: TimeInterval) {
        
        let animationDuration = 2.80
        UIView.animate(withDuration: animationDuration, delay: delay, options: []) {
            view.alpha = 1
        } completion: { success in
            self.coordinator?.navitage(coordinatorTo: .questionVC)
        }
    }
    
    

}

