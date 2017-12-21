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
    @IBOutlet weak var tb_confirmPassword: UITextField!
    @IBOutlet weak var lbl_Email: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseConfig.openHandle()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btn_Login(_ sender: Any) {
        if tb_confirmPassword.text! != "" {
            register(email: tb_email.text!, password: tb_password.text!, confirmedPassword: tb_confirmPassword.text!)
        }
        else {
            signIn(email: tb_email.text!, password: tb_password.text!)
        }
    }
    
    func signIn(email:String, password:String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            (user, error) in
            if let error = error {
                self.lbl_Email.text = error.localizedDescription
            }
            else if let user = user {
                self.lbl_Email.text = user.email
            }
        }
    }
    
    func register(email:String, password:String, confirmedPassword:String) {
        if password == confirmedPassword {
            Auth.auth().createUser(withEmail: email, password: password) {
                (user, error) in
                if let user = user {
                    let changeRequest = user.createProfileChangeRequest()
                    changeRequest.commitChanges {
                        (error) in
                        if let error = error {
                            self.lbl_Email.text = error.localizedDescription
                        }
                        self.publish(UserId: user.uid, Email: email)
                    }
                }
                else if let error = error {
                    self.lbl_Email.text = error.localizedDescription
                }
            }
        }
    }
    
    func publish(UserId id:String!, Email email:String!) {
        FirebaseConfig.ref.child("users/\(id!)").child("Email").setValue(email);
    }
}
