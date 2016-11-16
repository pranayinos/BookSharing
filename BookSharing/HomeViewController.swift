//
//  CustomSideMenuController.swift
//  BookSharing
//
//  Created by Pranay Kumar on 14/11/16.
//  Copyright © 2016 Inos. All rights reserved.
//

import Foundation
import SideMenuController

class HomeViewController: SideMenuController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "embedInitialCenterController", sender: nil)
        performSegue(withIdentifier: "embedSideController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier! == "embedInitialCenterController" && sender != nil {

            let destinationVC = segue.destination as! NavViewController
            let destinationRootVC = destinationVC.topViewController as! HomeRootViewController
            destinationRootVC.category = sender as! String

        }
        
    }

}
