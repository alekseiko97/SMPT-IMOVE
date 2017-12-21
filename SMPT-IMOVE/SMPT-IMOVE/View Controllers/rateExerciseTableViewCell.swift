//
//  rateExerciseTableViewCell.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 21/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class rateExerciseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
     @IBOutlet weak var lbl_exercisesName: UILabel!
     @IBOutlet weak var btn_SadEx: UIButton!
     @IBOutlet weak var btn_Neutx: UIButton!
     @IBOutlet weak var btn_GoodEx: UIButton!
    
    @IBAction func btn_goodPushed(_ sender: Any) {
        self.btn_GoodEx.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        self.btn_Neutx.tintColor = UIColor.white;
        self.btn_SadEx.tintColor = UIColor.white;
    }
    @IBAction func btn_neutralPushed(_ sender: Any) {
        self.btn_GoodEx.tintColor = UIColor.white;
        self.btn_Neutx.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
        self.btn_SadEx.tintColor = UIColor.white;
    }
    @IBAction func btn_sadPushed(_ sender: Any) {
        self.btn_GoodEx.tintColor = UIColor.white;
        self.btn_Neutx.tintColor = UIColor.white;
        self.btn_SadEx.tintColor = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0);
    }
}
