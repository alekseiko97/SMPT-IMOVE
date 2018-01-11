//
//  TrainingJournalViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class TrainingJournalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(3)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let MapTrainingCell: MapTrainingJournalTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MapTrainingCell", for: indexPath) as! MapTrainingJournalTableViewCell
        let WorkoutTrainingCell: WorkoutTrainingJournalTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WorkoutTableCell", for: indexPath) as! WorkoutTrainingJournalTableViewCell
        let WeightTrainingCell: WeightInTrainingJournalTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WeightInTableCell", for: indexPath) as! WeightInTrainingJournalTableViewCell
        
        if let weight = user.weight?.currentWeight
        {
            let text = String(describing: weight)
            WeightTrainingCell.textLabel?.text = "You weighted in at: \(text) kg."
        }
        WeightTrainingCell.textLabel?.textColor = UIColor.white
        
        if(indexPath.row == 0)
        {
            self.tableview.rowHeight = 200
            return(MapTrainingCell)
        }

        else if(indexPath.row == 1)
        {
            self.tableview.rowHeight = 155
            return(WorkoutTrainingCell)
        }
        else
        {
            self.tableview.rowHeight = 44
            return(WeightTrainingCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
