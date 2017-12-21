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
 
    override func viewDidLoad() {
        super.viewDidLoad()
        rateExerciseTableView.delegate = self
        rateExerciseTableView.dataSource = self
    }
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.black
        cell.tintColor = UIColor.white
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
        let cell : rateExerciseTableViewCell = rateExerciseTableView.dequeueReusableCell(withIdentifier: "rateExerciseCell", for: indexPath) as! rateExerciseTableViewCell
      
        cell.lbl_exercisesName?.text = exercises[indexPath.row]
        return cell;
    }
    @IBOutlet weak var rateExerciseTableView: UITableView!
    

}
