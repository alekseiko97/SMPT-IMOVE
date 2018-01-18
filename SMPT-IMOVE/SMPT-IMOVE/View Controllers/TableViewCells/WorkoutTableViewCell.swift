//
//  WorkoutTableViewCell.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 22/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_Exercise: UILabel!
    @IBOutlet weak var btn_Good: UIButton!
    @IBOutlet weak var btn_Neutral: UIButton!
    @IBOutlet weak var btn_Bad: UIButton!
    
    //at the beginning all the face buttons are white, the rated one becomes orange
    override func awakeFromNib() {
        super.awakeFromNib()
        //btn_Good.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        //btn_Neutral.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
       // btn_Bad.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        btn_Good.tintColor = UIColor.white;
        btn_Neutral.tintColor = UIColor.white;
        btn_Bad.tintColor = UIColor.white;
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btn_NeutralPushed(_ sender: Any) {
        self.btn_Good.tintColor = UIColor.white;
        self.btn_Neutral.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        self.btn_Bad.tintColor = UIColor.white;
    }
    @IBAction func btn_BadPushed(_ sender: Any) {
        self.btn_Good.tintColor = UIColor.white;
        self.btn_Neutral.tintColor = UIColor.white;
        self.btn_Bad.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
    }
    @IBAction func btn_GoodPushed(_ sender: Any) {
        self.btn_Good.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        self.btn_Neutral.tintColor = UIColor.white;
        self.btn_Bad.tintColor = UIColor.white;
    }
}
