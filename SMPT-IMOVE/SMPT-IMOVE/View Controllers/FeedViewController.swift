//
//  FeedViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 30/11/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var btn_Scale: UIButton!
    @IBOutlet weak var btn_Event: UIButton!
    @IBOutlet weak var btn_Map: UIButton!
    @IBOutlet weak var btn_Training: UIButton!
    @IBOutlet weak var lbl_Temp: UILabel!
    @IBOutlet weak var lbl_Humidity: UILabel!
    @IBOutlet weak var lbl_windSpeed: UILabel!
    @IBOutlet weak var lbl_ClothingAdvice: UILabel!
    
    let colour = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_Scale.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        btn_Event.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        btn_Map.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        btn_Training.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
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
