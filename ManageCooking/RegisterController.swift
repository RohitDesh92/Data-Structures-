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

class RegisterController: UIViewController {
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirm_password: UITextField!
    
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
                }
            }
        }
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
  
    
    
}
