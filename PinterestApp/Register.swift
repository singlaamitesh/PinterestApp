//
//  Register.swift
//  PinterestApp
//
//  Created by Amitesh Gupta on 25/08/24.
//

import UIKit
import FirebaseAuth

class Register: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
  
    @IBAction func RegisterButton(_ sender: UIButton) {
        if let email = emailText.text
            ,let password = passwordText.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e.localizedDescription)
                    
                }
                else{
                    self.performSegue(withIdentifier: "LoginToOpen", sender: self)
                }
            }
        }
        
    }
    

    
}
