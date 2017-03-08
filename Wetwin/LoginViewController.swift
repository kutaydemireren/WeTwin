//
//  LoginViewController.swift
//  Wetwin
//
//  Created by Kutay Demireren on 29/10/15.
//  Copyright © 2015 Kutay Demireren. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard");
        view.addGestureRecognizer(tap);
        
        
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "KULLANICI ADI", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()]);
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "PAROLA", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()]);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitButtonPressed(sender: AnyObject){
        dismissViewControllerAnimated(true, completion: nil);
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func slideFrameUp(){
        slideFrame(true);
    }
    
    @IBAction func slideFrameDown(){
        slideFrame(false);
    }
    
    @IBAction func girisPressed(Sender : AnyObject){
        
        PFUser.logInWithUsernameInBackground(usernameTextField.text!, password: passwordTextField.text!, block: { (user, error) -> Void in
            
            if user != nil {
                
                //self.performSegueWithIdentifier("login", sender: self)
                
                print("asd")
                let vc:UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("MainApp"))!;
                
                vc.modalTransitionStyle =  UIModalTransitionStyle.CrossDissolve
                self.presentViewController(vc, animated: true, completion: nil);
                
                
                
            }else {
                if let _ = error!.userInfo["error"] as? String {
                    
                }
                //display alert
                let alert = UIAlertController(title: "Giriş Yapılamadı", message: "Bilgilerini ve bağlantını yeniden kontrol et.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
            
            
           
        })
    }
    
    
    
    func slideFrame(up: Bool){
        let movementDistance:CGFloat = 40.0;
        let movementDuration = 0.3;
        
        let movement = (up ? -movementDistance : movementDistance);
        
        UIView.beginAnimations("anim", context: nil);
        UIView.setAnimationBeginsFromCurrentState(true);
        UIView.setAnimationDuration(movementDuration);
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        UIView.commitAnimations();
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
