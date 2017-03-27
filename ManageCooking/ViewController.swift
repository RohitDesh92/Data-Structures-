//
//  ViewController.swift
//  ManageCooking
//
//  Created by Rohit Deshmukh on 3/19/17.
//  Copyright © 2017 San Jose State University. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var Err_msg: UITextView!
    
    
    
    @IBAction func sign_in(_ sender: Any) {
        let email = username.text
        let pass = password.text
      
        if ((username.text != nil) || (password.text != nil)){
             FIRAuth.auth()?.signIn(withEmail: email!, password: pass!) { (user, error) in
                if error == nil{
                 self.performSegue(withIdentifier: "SignInId", sender: nil)
                }
                else{
                  self.Err_msg.text = "*Invalid Username/Password"
                }
            } }
            else{
              
            
            }//else
            
           }//if
    
    override func viewDidLoad() {
         super.viewDidLoad()
         self.username.delegate = self
         self.password.delegate = self
        
        }
  
    
    // Hide keybord when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
  
    }
    
    //Hide keyboard when user press returns.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        username.resignFirstResponder()
        password.resignFirstResponder()
        return (true)
        
    }

}

