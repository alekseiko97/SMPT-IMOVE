//
//  WeightViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 14/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController {
    
    @IBOutlet weak var lbl_CurrentWeight: UILabel!
    @IBOutlet weak var lbl_LastWeight: UILabel!
    @IBOutlet weak var lbl_WeeklyAverage: UILabel!
    @IBOutlet weak var lbl_MontlyAverage: UILabel!
    
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get user from firebase
<<<<<<< HEAD
        // user = User(name: "Roos", email: "roos@shadowphoenix.nl", weight: Weight(currentWeight: 57.5))
=======
        user = User(id: "1", name: "Roos", email: "roos@shadowphoenix.nl", weight: Weight(currentWeight: 57.5))
>>>>>>> 0ccb90d346301b2833132ae9d59ea00c5523fa01
        lbl_CurrentWeight.text = String(format: "%.1f", (user?.weight?.currentWeight)!)
        // Get last weight from user database
        lbl_LastWeight.text = String(format: "%.1f", 57.6)
        lbl_WeeklyAverage.text = String(format: "%.1f", Weight.calcWeeklyAverage())
        //lbl_MontlyAverage.text = String(format: "%.1f", Weight.calcMonthlyAverage())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToWeight(segue: UIStoryboardSegue) {}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
