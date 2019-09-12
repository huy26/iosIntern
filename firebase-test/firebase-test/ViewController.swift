//
//  ViewController.swift
//  firebase-test
//
//  Created by Mac on 9/6/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.delegate=self
        passwordField.delegate=self
        
        getStartedButton.layer.cornerRadius = 5
        
        usernameField.clearsOnBeginEditing = true
        passwordField.clearsOnBeginEditing = true
        
    }

    @IBAction func OnGetStarted(_ sender: Any) {
        print("Button Pressed")
       
    }
    
    @IBAction func OnSignUp(_ sender: Any) {
        print("Sign up btn pressed")
  
    }

}

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}

