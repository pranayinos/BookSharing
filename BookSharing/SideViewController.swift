//
//  SideViewController.swift
//  BookSharing
//
//  Created by Pranay Kumar on 14/11/16.
//  Copyright © 2016 Inos. All rights reserved.
//

import UIKit

class SideViewController: UITableViewController {

    let segues = ["All", "Science Fiction", "Drama", "Action and Adventure", "Romance", "Mystery", "Horror", "Selfhelp"]
    
    let section = ["Categories"]
    
    var selectedCategory = "All"
    
    private var previousIndex: NSIndexPath?
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.section[section]
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.init(white: 0.76, alpha: 1)
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segues.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell")!
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        cell.textLabel?.text = "\(segues[indexPath.row])"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath)  {
        if let index = previousIndex {
            tableView.deselectRow(at: index as IndexPath, animated: true)
        }

        selectedCategory = segues[indexPath.row]
        
        sideMenuController?.performSegue(withIdentifier: "embedInitialCenterController", sender: selectedCategory)

        previousIndex = indexPath as NSIndexPath?
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
