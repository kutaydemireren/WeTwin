//
//  RecentlyAddedViewController.swift
//  WeTwin
//
//  Created by Kutay Demireren on 30/10/15.
//  Copyright © 2015 Kutay Demireren. All rights reserved.
//

import UIKit

class RecentlyAddedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var selectedRowTitle:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectedSegmentChange(sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(segmentedControl.selectedSegmentIndex==0){ //Place ("Yer") is selected.
            return "Yeni Eklenen Yerler"
        }else{ //Feeling ("His") is selected.
            return "Yeni Eklenen Hisler"
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        if(segmentedControl.selectedSegmentIndex==0){ //Place ("Yer") is selected.
            let place = cell.viewWithTag(1) as? UILabel
            place?.text = "Okuldayım"
        }else{ //Feeling ("His") is selected.
            let feeling = cell.viewWithTag(1) as? UILabel
            feeling?.text = "Okuldayım, çok sıkılıyorum"
        }
        
        let howManyPeopleInside = cell.viewWithTag(2) as? UILabel
        howManyPeopleInside?.text = "3 dk"
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = self.tableView.indexPathForSelectedRow!
        let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        
        let cellLabel = cell.viewWithTag(1) as? UILabel
        selectedRowTitle = cellLabel?.text
        
        if(segue.identifier == "FromRecentlyAddedToTwens") {
            let vc = segue.destinationViewController as! TwenSelectionViewController
           if(segmentedControl.selectedSegmentIndex==0){ //Place ("Yer") is selected.
                vc.titleForView = selectedRowTitle
            }else{
                vc.titleForView = selectedRowTitle
                
           }
        }
    }
}
