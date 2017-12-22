//
//  WorkoutViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    var exercises: [String] = ["exrs 1","exrs 2","exrs 3","exrs 4","exrs 5","exrs 6","exrs 7","exrs 8","exrs 9","exrs 10","exrs 11", "exrs 12"]
    
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
