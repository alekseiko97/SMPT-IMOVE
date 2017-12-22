//
//  RegisterViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 21/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    @IBOutlet weak var lbl_Email: UILabel!
    @IBOutlet weak var tb_username: UITextField!
    @IBOutlet weak var tb_gender: UITextField!
    @IBOutlet weak var tb_age: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userID = Auth.auth().currentUser?.uid
        FirebaseConfig.ref.child("users").child(userID!).observeSingleEvent(of: .value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            let email = value?["Email"] as? String
            let username = value?["Username"] as? String
            
            self.lbl_Email.text = email
        })
//        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_Save(_ sender: Any) {
        UserFirebase.publish(UserId: Auth.auth().currentUser?.uid, Username: tb_username.text!, Gender: tb_gender.text!, Age: Int(tb_age.text!))
    }
    
    @IBAction func btn_LogOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print(signOutError.localizedDescription)
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
