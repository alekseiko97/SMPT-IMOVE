//
//  AddWeightViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 14/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class AddWeightViewController: UIViewController {
    
    @IBOutlet weak var tb_NewWeight: UITextField!
    @IBOutlet weak var tb_NewWeightDecimal: UITextField!
    
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Get user from db
        user = User(name: "Roos", email: "roos@shadowphoenix.nl", weight: Weight(currentWeight: 57.5))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_SubmitWeight(_ sender: Any) {
        if (tb_NewWeight.text! != "" && tb_NewWeightDecimal.text! != "") {
            var weight : Double
            weight = Double(tb_NewWeight.text!)!
            weight += (Double(tb_NewWeightDecimal.text!)! / 10)
            print(weight)
        }
        else if (tb_NewWeight.text! != "") {
            var weight : Double
            weight = Double(tb_NewWeight.text!)!
            print(weight)
        }
        else { print("Stop that you stupid") }
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
