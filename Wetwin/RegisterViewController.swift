//
//  RegisterViewController.swift
//  Wetwin
//
//  Created by Kutay Demireren on 28/10/15.
//  Copyright © 2015 Kutay Demireren. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    
    weak var currentTextField: UITextField!
    
    var defaultHeight: CGFloat = 0.0
    var keyboardY: CGFloat = 0.0
    var textY: CGFloat = 0.0
    var movement: CGFloat = 0.0;
    var times: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "İSİM, SOYİSİM", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()]);
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "KULLANICI ADI", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()]);
        emailTextField.attributedPlaceholder = NSAttributedString(string: "E-MAIL", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()]);
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "PAROLA", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()]);
        passwordAgainTextField.attributedPlaceholder = NSAttributedString(string: "PAROLA TEKRAR", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()]);

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitButtonPressed(sender: AnyObject){
        dismissViewControllerAnimated(true, completion: nil);
    }
    

    @IBAction func kayitOlButtonPressed(sender: AnyObject){
      
        let user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        user.email = emailTextField.text
       //user.setValue(false, forKey: "emailVerified")
        
        user.signUpInBackgroundWithBlock({ (succes, error) -> Void in
            
            if error == nil {
                //Signed Up
                self.performSegueWithIdentifier("loginback", sender: "View")
                
            } else  {
                
                if let _ = error!.userInfo["error"] as? String {
               
                }
                
                //display alert
                let alert = UIAlertController(title: "Giriş Yapılamadı", message: "Bilgilerini ve bağlantını yeniden kontrol et.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        })
        
        /* var post = PFObject(className: "profiles")
        
        post["userId"] = user.objectId
        let picture = NSData(contentsOfURL: picture)
        let pictureFile = PFFile(name:"picture.jpeg",data: picture!)
        post["picture"] = videoFile
        post.saveInBackgroundWithBlock { (succes, error) -> Void in
        self.activityIndicator.stopAnimating()
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
        if error == nil {
        //succes
        } else {
        //error
        
        }
        
        }*/

    }
    
    func dismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    //  To navigate between text fields. Only through the further navigation is avaliable.
    //  Whenever the last text field is reached and done with editing it, next state is to signing up and
    //the button signing up is automatically called.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        dismissKeyboard()
        // Try to find next responder
        let nextTag = textField.tag + 1;
        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder!
        
        if (nextResponder != nil){
            // Found next responder, so set it.
            nextResponder?.becomeFirstResponder()
        }
        else
        {
            //Not found, so remove keyboard
            textField.resignFirstResponder()
            
            //That is the time when the last text field used.
            let signUpButton = self.view.viewWithTag(10); //10 is the tag number assigned to "Giris Yap" Button
            kayitOlButtonPressed(signUpButton!)
        }
        return false // We do not want UITextField to insert line-breaks.
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        currentTextField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        currentTextField = textField
    }
    
    func keyboardWillShow(notif: NSNotification){
        times = times + 1
        if(times == 1){
        let info:NSDictionary = notif.userInfo!;
        let kbFrame = info.objectForKey(UIKeyboardFrameEndUserInfoKey)
        let animationDuration = info.objectForKey(UIKeyboardAnimationDurationUserInfoKey)?.doubleValue
        let keyboardFrame = kbFrame?.CGRectValue
        let height = keyboardFrame?.size.height
        
        self.keyboardY = (self.view.frame.height - height!)
        self.textY = currentTextField.frame.origin.y + currentTextField.frame.height
            
        if(textY > keyboardY){
            movement = self.keyboardY - self.textY
        }else{
            movement = 0.0
        }

        UIView.beginAnimations("anim", context: nil);
        UIView.setAnimationBeginsFromCurrentState(true);
        UIView.setAnimationDuration(animationDuration!);
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement);
        UIView.commitAnimations();
        }
        
    }
    
     func keyboardWillHide(notif: NSNotification){
        let info:NSDictionary = notif.userInfo!;
        let animationDuration = info.objectForKey(UIKeyboardAnimationDurationUserInfoKey)?.doubleValue
        
//        NSLog("Updating constraints, hide.")
//        
//        
//        NSLog("textY %@", textY.description)
//        NSLog("keyboardY %@", keyboardY.description)
        
        if(self.textY > self.keyboardY){
            movement = textY - keyboardY
        }else{
            movement = 0.0
        }
        
//        NSLog("movement %@", movement.description)

        UIView.beginAnimations("anim", context: nil);
        UIView.setAnimationBeginsFromCurrentState(true);
        UIView.setAnimationDuration(animationDuration!);
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement);
        UIView.commitAnimations();
        
        times = 0
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
