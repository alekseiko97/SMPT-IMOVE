//
//  TrainingJournalViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class TrainingJournalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Will be the users data from database
    let MapTrainingTest = ["Map Test"]
    let WorkoutTest = ["Workout Test"]
    let WeightTest = ["Weight Test"]
    
    let MapTrainingCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "MapTrainingCell")
    let WorkoutTrainingCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "WorkoutTrainingCell")
    let WeightTrainingCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "WeightCell")

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(indexPath.row == 0)
        {
            MapTrainingCell.textLabel?.text = MapTrainingTest[0]
            return(MapTrainingCell)
        }
        
        else if(indexPath.row == 1)
        {
            WorkoutTrainingCell.textLabel?.text = WorkoutTest[0]
            return(WorkoutTrainingCell)
        }
        else
        {
            WeightTrainingCell.textLabel?.text = WeightTest[0]
            return(WeightTrainingCell)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if MapTrainingCell.isSelected == true
        {
            performSegue(withIdentifier: mapSegue, sender: <#T##Any?#>)
        }
        if WorkoutTrainingCell.isSelected == true
        {
            performSegue(withIdentifier: workoutSegue, sender: Any?)
        }
        if WeightTrainingCell.isSelected == true
        {
            performSegue(withIdentifier: weightSegue, sender: <#T##Any?#>)
        }
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
