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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_WeeklyAverage.text = String(format: "%.1f", Weight.calcWeeklyAverage())
        //lbl_WeeklyAverage.text = String(Weight.calcWeeklyAverage())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
