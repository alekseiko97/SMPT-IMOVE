//
//  WeightInTrainingJournalTableViewCell.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class WeightInTrainingJournalTableViewCell: UITableViewCell {

    @IBOutlet weak var weight_info: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        weight_info.text = "You weighted 65 kg on 21/03/2018"
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
