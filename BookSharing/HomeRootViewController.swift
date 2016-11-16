//
//  HomeRootViewController.swift
//  BookSharing
//
//  Created by Pranay Kumar on 15/11/16.
//  Copyright © 2016 Inos. All rights reserved.
//

import UIKit
import SideMenuController

class HomeRootViewController: UIViewController {

    var category = "ALL"
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryLabel.text = category
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
