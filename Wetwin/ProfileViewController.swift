//
//  ProfileViewController.swift
//  Wetwin
//
//  Created by Kutay Demireren on 28/10/15.
//  Copyright © 2015 Kutay Demireren. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var profilePhoto: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePhoto?.layer.cornerRadius = (profilePhoto?.frame.size.width)!/2
        profilePhoto?.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectedSegmentChange(sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(segmentedControl.selectedSegmentIndex==0){ //"Twen Davetleri" selected.
            return "Twen Davetleri"
        }else if(segmentedControl.selectedSegmentIndex==1){ //"Sohbet Davetleri" selected.
            return "Sohbet Davetleri"
        }else{ //"Son Durumların" selected.
            return "Son Durumların"
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if(segmentedControl.selectedSegmentIndex==0){ //"Twen Davetleri" selected.
            let cell = tableView.dequeueReusableCellWithIdentifier("TwenAndChatRequests", forIndexPath: indexPath) as UITableViewCell
            let place = cell.viewWithTag(1) as? UILabel
            place?.text = "Engin Can Kurt"
            return cell;
        }else if(segmentedControl.selectedSegmentIndex==1){ //"Sohbet Davetleri" selected.
            let cell = tableView.dequeueReusableCellWithIdentifier("TwenAndChatRequests", forIndexPath: indexPath) as UITableViewCell
            let feeling = cell.viewWithTag(1) as? UILabel
            feeling?.text = "Engin Can Kurt"
            return cell;
        }else{ //"Son Durumların" selected.
            let cell = tableView.dequeueReusableCellWithIdentifier("LatestActivity", forIndexPath: indexPath) as UITableViewCell
            let feeling = cell.viewWithTag(1) as? UILabel
            feeling?.text = "Okul"
            return cell;
        }
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
