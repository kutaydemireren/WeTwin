//
//  TwenSelectionViewController.swift
//  Wetwin
//
//  Created by Kutay Demireren on 05/10/15.
//  Copyright © 2015 Kutay Demireren. All rights reserved.
//

import UIKit

class TwenSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var titleLabelForPopularView: UILabel!
    
    @IBOutlet weak var titleLabelForRecentView: UILabel!
    
    var titleForView: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(titleLabelForPopularView != nil){
            titleLabelForPopularView.text = titleForView
        } else{
            titleLabelForRecentView.text = titleForView
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Twen Seç!"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        let twenImage = cell.viewWithTag(1) as? UIImageView
        twenImage?.layer.cornerRadius = (twenImage?.frame.size.width)!/2
        twenImage?.clipsToBounds = true
        
        let twenName = cell.viewWithTag(2) as? UILabel
        twenName?.text = "Engin Can Kurt"
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
