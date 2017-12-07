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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = CGFloat()
                if indexPath.row == 1 {
                    height = 250
                }
                else if indexPath.row == 2 {
                    height = 150
                }
                else
                {
                    height = 50
                }
        return height
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(3)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let MapTrainingCell: MapTrainingJournalTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MapTrainingCell", for: indexPath) as! MapTrainingJournalTableViewCell
        let WorkoutTrainingCell: WorkoutTrainingJournalTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WorkoutTableCell", for: indexPath) as! WorkoutTrainingJournalTableViewCell
        let WeightTrainingCell: WeightInTrainingJournalTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WeightInTableCell", for: indexPath) as! WeightInTrainingJournalTableViewCell

        if(indexPath.row == 0)
        {
            //MapTrainingCell.textLabel?.text = MapTrainingTest[0]
            return(MapTrainingCell)
        }

        else if(indexPath.row == 1)
        {
            //WorkoutTrainingCell.textLabel?.text = WorkoutTest[0]
            return(WorkoutTrainingCell)
        }
        else
        {
            //WeightTrainingCell.textLabel?.text = WeightTest[0]
            return(WeightTrainingCell)
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
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
