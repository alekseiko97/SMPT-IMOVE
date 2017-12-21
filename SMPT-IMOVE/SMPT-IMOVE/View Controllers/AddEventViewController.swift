//
//  AddEventViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 07/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {
    @IBOutlet weak var tb_DateTime: UITextField!
    @IBOutlet weak var tb_Description: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateTimePicker : UIDatePicker = UIDatePicker()
        dateTimePicker.datePickerMode = UIDatePickerMode.dateAndTime
        tb_DateTime.inputView = dateTimePicker
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
