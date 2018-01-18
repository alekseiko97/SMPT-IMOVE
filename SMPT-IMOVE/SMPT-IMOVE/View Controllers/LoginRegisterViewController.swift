//
//  LoginRegisterViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 21/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import Firebase

class LoginRegisterViewController: UIViewController {
    @IBOutlet weak var tb_email: UITextField!
    @IBOutlet weak var tb_password: UITextField!
    @IBOutlet weak var lbl_Error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_Error.lineBreakMode = .byWordWrapping
        lbl_Error.numberOfLines = 0
        FirebaseConfig.openHandle()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btn_Login(_ sender: Any) {
        signIn(email: tb_email.text!, password: tb_password.text!)
    }
    
    func signIn(email:String, password:String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            (user, error) in
            if let error = error {
                self.lbl_Error.text = error.localizedDescription
            }
            else if let user = user {
                UserFirebase.logInUser(id: user.uid, email: user.email!, username: "", weight: nil, goal: "", gender: "", age: nil)
                self.lbl_Error.text = UserFirebase.user.email
                self.performSegue(withIdentifier: "logInSegue", sender: self)
            }
        }
    }
}
