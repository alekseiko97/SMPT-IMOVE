//
//  RegisterViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 21/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import Firebase

class AdditionalInfoViewController: UIViewController {
    @IBOutlet weak var tb_username: UITextField!
    @IBOutlet weak var tb_gender: UITextField!
    @IBOutlet weak var tb_age: UITextField!
    let datepicker : UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        createDatePicker()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_Next(_ sender: Any) {
        
        
        UserFirebase.publish(UserId: Auth.auth().currentUser?.uid, Username: tb_username.text!, Gender: tb_gender.text!, Age: Int(tb_age.text!))
    }
    
    func createDatePicker(){
        datepicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let donebutton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([donebutton], animated: false)
        tb_age.inputAccessoryView = toolbar
        tb_age.inputView = datepicker
    }
    
    @objc func donePressed(){
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .short
        tb_age.text = dateformatter.string(from: datepicker.date)
        self.view.endEditing(true)
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
