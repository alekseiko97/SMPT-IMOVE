//
//  StateGoalViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 11/01/2018.
//  Copyright © 2018 Fhict. All rights reserved.
//

import UIKit
import Firebase

class StateGoalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btn_StayInShape(_ sender: Any) {
        UserFirebase.publish(UserId: Auth.auth().currentUser?.uid, Goal: "Stay In Shape");
        performSegue(withIdentifier: "stateGoal", sender: self);
    }
    
    @IBAction func btn_GetInShape(_ sender: Any) {
        UserFirebase.publish(UserId: Auth.auth().currentUser?.uid, Goal: "Get In Shape");
        performSegue(withIdentifier: "stateGoal", sender: self);
    }
    
    @IBAction func btn_LoseWeight(_ sender: Any) {
        UserFirebase.publish(UserId: Auth.auth().currentUser?.uid, Goal: "Lose Weight");
        performSegue(withIdentifier: "stateGoal", sender: self);
    }
    
    // UserFirebase.publish(UserId: Auth.auth().currentUser?.uid, Username: tb_username.text!, Gender: tb_gender.text!, Age: tb_birthday.text!)
}
