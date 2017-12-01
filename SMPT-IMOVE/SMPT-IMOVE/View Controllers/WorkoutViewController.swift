//
//  WorkoutViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController {

    // Exercise 1
    @IBOutlet weak var btn_GoodEx1: UIButton!
    @IBOutlet weak var btn_NeutralEx1: UIButton!
    @IBOutlet weak var btn_SadEx1: UIButton!
    @IBOutlet weak var lbl_Ex1: UILabel!
    
    // Exercise 2
    @IBOutlet weak var btn_GoodEx2: UIButton!
    @IBOutlet weak var btn_NeutralEx2: UIButton!
    @IBOutlet weak var btn_SadEx2: UIButton!
    @IBOutlet weak var lbl_Ex2: UILabel!
    
    // Exercise 3
    @IBOutlet weak var btn_GoodEx3: UIButton!
    @IBOutlet weak var btn_NeutralEx3: UIButton!
    @IBOutlet weak var btn_SadEx3: UIButton!
    @IBOutlet weak var lbl_Ex3: UILabel!
    
    // Exercise 4
    @IBOutlet weak var btn_GoodEx4: UIButton!
    @IBOutlet weak var btn_NeutralEx4: UIButton!
    @IBOutlet weak var btn_SadEx4: UIButton!
    @IBOutlet weak var lbl_Ex4: UILabel!
    
    // Exercise 5
    @IBOutlet weak var btn_GoodEx5: UIButton!
    @IBOutlet weak var btn_NeutralEx5: UIButton!
    @IBOutlet weak var btn_SadEx5: UIButton!
    @IBOutlet weak var lbl_Ex5: UILabel!
    
    // Exercise 6
    @IBOutlet weak var btn_GoodEx6: UIButton!
    @IBOutlet weak var btn_NeutralEx6: UIButton!
    @IBOutlet weak var btn_SadEx6: UIButton!
    @IBOutlet weak var lbl_Ex6: UILabel!
    
    // Exercise 7
    @IBOutlet weak var btn_GoodEx7: UIButton!
    @IBOutlet weak var btn_NeutralEx7: UIButton!
    @IBOutlet weak var btn_SadEx7: UIButton!
    @IBOutlet weak var lbl_Ex7: UILabel!
    
    // Exercise 8
    @IBOutlet weak var btn_GoodEx8: UIButton!
    @IBOutlet weak var btn_NeutralEx8: UIButton!
    @IBOutlet weak var btn_SadEx8: UIButton!
    @IBOutlet weak var lbl_Ex8: UILabel!
    
    // Exercise 9
    @IBOutlet weak var btn_GoodEx9: UIButton!
    @IBOutlet weak var btn_NeutralEx9: UIButton!
    @IBOutlet weak var btn_SadEx9: UIButton!
    @IBOutlet weak var lbl_Ex9: UILabel!
    
    // Exercise 10
    @IBOutlet weak var btn_GoodEx10: UIButton!
    @IBOutlet weak var btn_NeutralEx10: UIButton!
    @IBOutlet weak var btn_SadEx10: UIButton!
    @IBOutlet weak var lbl_Ex10: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_SadEx1.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_NeutralEx1.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_GoodEx1.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_SadEx2.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_NeutralEx2.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_GoodEx2.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_SadEx3.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_NeutralEx3.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_GoodEx3.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_SadEx4.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_NeutralEx4.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_GoodEx4.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_SadEx5.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_NeutralEx5.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_GoodEx5.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_SadEx6.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_NeutralEx6.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_GoodEx6.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_SadEx7.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_NeutralEx7.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_GoodEx7.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_SadEx8.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_NeutralEx8.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_GoodEx8.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_SadEx9.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_NeutralEx9.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_GoodEx9.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_SadEx10.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_NeutralEx10.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_GoodEx10.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        
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
