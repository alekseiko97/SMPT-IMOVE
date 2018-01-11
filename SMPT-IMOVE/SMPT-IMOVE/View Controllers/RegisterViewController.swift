//
//  RegisterViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 22/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var lbl_Error: UILabel!
    @IBOutlet weak var tb_Email: UITextField!
    @IBOutlet weak var tb_Password: UITextField!
    @IBOutlet weak var tb_ConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_Register(_ sender: Any) {
        if tb_Email.text! == "" || tb_Password.text! == "" || tb_ConfirmPassword.text! == "" {
            lbl_Error.text = "Fill in all the fields"
        }
        else {
            register(email: tb_Email.text!, password: tb_Password.text!, confirmedPassword: tb_ConfirmPassword.text!);
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
                            self.lbl_Error.text = error.localizedDescription
                        }
                        UserFirebase.publish(UserId: user.uid, Email: email)
                    }
                    self.performSegue(withIdentifier: "registerSegue", sender: self)
                }
                else if let error = error {
                    self.lbl_Error.text = error.localizedDescription
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
