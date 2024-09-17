//
//  LoginControllerViewController.swift
//  PinterestApp
//
//  Created by Amitesh Gupta on 24/08/24.
//

import UIKit
import FirebaseAuth

class LoginControllerViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
  
    @IBAction func loginButtonTapped(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard self != nil else { return }
                if let e = error{
                    print(e.localizedDescription)
                }
                else{
                    self?.performSegue(withIdentifier:"RegisterToOpen", sender: self)
                }
            }
        }
        
                
    }
    
}
