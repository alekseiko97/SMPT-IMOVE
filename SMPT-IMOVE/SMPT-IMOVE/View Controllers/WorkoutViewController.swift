//
//  WorkoutViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    //example exercises,real execises will be added from database
    var exercises: [String] = ["exers 1","exers 2","exers 3","exers 4","exers 5","exers 6","exers 7","exers 8","exers 9","exers 10","exers 11", "exers 12"]
    
    @IBOutlet weak var workoutTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutTableView.delegate = self
        workoutTableView.dataSource = self
        // Do any additional setup after loading the view.

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     var selectedrow: Int = 0
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return exercises.count
    }
    
   func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell : WorkoutTableViewCell = workoutTableView.dequeueReusableCell(withIdentifier: "rateExerciseCell", for: indexPath) as!WorkoutTableViewCell
      
      cell.lbl_Exercise.text = exercises[indexPath.row]
       return cell;
   }
   
    

}
