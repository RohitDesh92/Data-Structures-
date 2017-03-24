//
//  RegisterController.swift
//  ManageCooking
//
//  Created by Rohit Deshmukh on 3/20/17.
//  Copyright © 2017 San Jose State University. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class RegisterController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirm_password: UITextField!
    @IBOutlet weak var ErrorMsg: UITextView!
    @IBOutlet weak var Err_pass: UITextView!
    
    @IBAction func Signup(_ sender: Any) {
        if password.text == confirm_password.text {
         
             let email = Email.text;
             let Password = password.text;
           
             FIRAuth.auth()?.createUser(withEmail: email!, password: Password!) { (user, error) in
                if error == nil {
                    print("No Error");
                  self.performSegue(withIdentifier: "SignIn", sender: nil)
                }
                else{
                   print("Cant Sign In User")
                    self.ErrorMsg.text = "* You have already Signed Up"
                }//else
            }//else
        }
        else{
         Err_pass.text = "* Password Doesn't match "
        }//else
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Email.delegate = self
        self.password.delegate = self
        self.confirm_password.delegate = self
       
    }
    // Hide keybord when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Email.resignFirstResponder()
        password.resignFirstResponder()
        confirm_password.resignFirstResponder()
        return (true)
    }
  
    
    
}
