//
//  ResetPasswordView.swift
//  firebase-test
//
//  Created by Mac on 9/13/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordView: UIViewController {

    @IBOutlet weak var getpasswordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         getpasswordField.clearsOnBeginEditing = true
    }
    
    @IBAction func onGetPassword(_ sender: Any) {
        
        let getpassword = getpasswordField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().sendPasswordReset(withEmail: getpassword!) { error in
            if error != nil {
                print("Email does not exist")
                print(error.debugDescription)
            } else {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
                let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "MainView")
                self.present(balanceViewController, animated: true, completion: nil)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
