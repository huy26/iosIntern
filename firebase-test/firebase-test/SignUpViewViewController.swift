//
//  SignUpViewViewController.swift
//  firebase-test
//
//  Created by Mac on 9/6/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmpassField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameField.clearsOnBeginEditing = true
        passwordField.clearsOnBeginEditing = true
        confirmpassField.clearsOnBeginEditing = true
    }
    

}
