//
//  TemplateViewController.swift
//  Wetwin
//
//  Created by engincankurt on 28/10/15.
//  Copyright © 2015 Kutay Demireren. All rights reserved.
//

import UIKit

class TemplateViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var contentView: UIView!
    
    weak var currentViewController: UIViewController!
    
    @IBOutlet weak var tabIcon: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let vc:UIViewController = viewControllerForSegmentIndex(segmentedControl.selectedSegmentIndex);
        addChildViewController(vc);
        vc.view.frame = self.contentView.bounds;
        self.contentView.addSubview(vc.view);
        self.currentViewController = vc;
    }
    
    @IBAction func segmentChanged(sender: UISegmentedControl){
        let vc:UIViewController = viewControllerForSegmentIndex(sender.selectedSegmentIndex);
        addChildViewController(vc);
        transitionFromViewController(currentViewController, toViewController: vc, duration: 0, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            }, completion: { (finished: Bool) -> Void in
                self.currentViewController.view.removeFromSuperview();
                vc.view.frame = self.contentView.bounds;
                self.contentView.addSubview(vc.view);
                vc.didMoveToParentViewController(self);
                self.currentViewController.removeFromParentViewController();
                self.currentViewController = vc;
        })
        
    }
    
    func viewControllerForSegmentIndex(index: NSInteger) -> UIViewController {
        let vc:UIViewController;
        switch (index) {
        case 0: //selected index 0.
            vc = (self.storyboard?.instantiateViewControllerWithIdentifier("PlaceViewController"))!;
            break;
        case 1: //selected index 1.
            vc = (self.storyboard?.instantiateViewControllerWithIdentifier("FeelingViewController"))!;
            break;
        default: //just in case, let it the first one..
            vc = (self.storyboard?.instantiateViewControllerWithIdentifier("PlaceViewController"))!;
            break;
        }
        return vc;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
