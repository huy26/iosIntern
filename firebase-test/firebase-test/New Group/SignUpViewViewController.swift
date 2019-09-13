//
//  SignUpViewViewController.swift
//  firebase-test
//
//  Created by Mac on 9/6/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmpassField: UITextField!
    
    @IBOutlet weak var getpasswordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameField.clearsOnBeginEditing = true
        passwordField.clearsOnBeginEditing = true
        confirmpassField.clearsOnBeginEditing = true
    }
    
    func validateField() -> String? {
        
        // check all field are filled
        if usernameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || confirmpassField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            print("Please fill in username and password")
            
        }
        //to-do: check password secure
        
        return nil
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let error = validateField()
        let username = usernameField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        print(username!)
        let password = passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        print(password!)
        let confirmpass = confirmpassField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if  error != nil ||  password != confirmpass {
            showError(_message: "check username and password")
        } else {
            Auth.auth().createUser(withEmail: username!, password: password!) { (result, err) in
                if err != nil {
                    print(err.debugDescription)
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["username": username as Any, "password": password as Any, "uid": result!.user.uid]) {
                        (error) in
                        if error != nil {
                            self.showError(_message: "User data coudln't")
                        }
                    }
                    self.transitionToHome()
                }
            }
        }
    }
    
    
    func showError(_message: String){
        let alert = UIAlertController(title: "Hint", message: "\(_message)", preferredStyle:.alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(alertAction)
        present(alert,animated: true, completion: nil)
    }
    func transitionToHome() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "TaskVC") as! UINavigationController
        self.present(balanceViewController, animated: true, completion: nil)
    }
    
    
  
}
