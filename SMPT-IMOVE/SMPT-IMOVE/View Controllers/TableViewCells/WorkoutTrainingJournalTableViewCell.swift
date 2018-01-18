//
//  WorkoutTrainingJournalTableViewCell.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class WorkoutTrainingJournalTableViewCell: UITableViewCell {

    @IBOutlet weak var perform_info: UILabel!
    
    @IBOutlet weak var exerc_1: UILabel!
    @IBOutlet weak var exerc_2: UILabel!
    
    @IBOutlet weak var exerc_3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        perform_info.text = "Workout performed on 21/03/2018"
        exerc_1.text = "Running"
        exerc_2.text = "Group competition"
        exerc_3.text = "Bench exercises"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
