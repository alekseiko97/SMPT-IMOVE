//
//  RouteTableViewCell.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class RouteTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var routeLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
