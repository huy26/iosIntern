//
//  ViewController.swift
//  firebase-test
//
//  Created by Mac on 9/6/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Firebase
//import GoogleSignIn

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
        print("Sign up btn pressed")
        
        let username = usernameField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: username!, password: password!) { [weak self] user, error in
            if error != nil {
                print("errow login")
                print(error.debugDescription)
            } else {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
                let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "TaskVC") as! UINavigationController
                self!.present(balanceViewController, animated: true, completion: nil)
            }
        }
       
    }
    
    @IBAction func OnSignUp(_ sender: Any) {
       print("go to sign up")
    }

}

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}

