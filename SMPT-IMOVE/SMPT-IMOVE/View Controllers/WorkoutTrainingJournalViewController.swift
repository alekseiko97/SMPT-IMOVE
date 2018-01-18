//
//  WorkoutTrainingJournalViewController.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 17/01/2018.
//  Copyright © 2018 Fhict. All rights reserved.
//

import Foundation
import UIKit

struct Row {
    var name : String
    var set : Int
    var difficulty : LevelOfDifficulty
    
}
class WorkoutTrainingJournalViewController: UIViewController,UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var workout_tableView: UITableView!
    
    @IBOutlet weak var date_label: UILabel!
    
    var exercises: [Row] = [
        Row (name: "exercise 1", set: 2, difficulty: LevelOfDifficulty.Hard),
        Row (name: "exercise 2", set: 4, difficulty: LevelOfDifficulty.Easy),
        Row (name: "exercise 3", set: 7, difficulty: LevelOfDifficulty.Challenging)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        workout_tableView.delegate = self
        workout_tableView.dataSource = self
        date_label.text = "16/01/2018"
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
        let cell : WorkoutCell = workout_tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as!WorkoutCell
        
        cell.exercise.text = exercises[indexPath.row].name
        cell.set_label.text = "\(exercises[indexPath.row].set)"
        cell.difficulty_label.text = exercises[indexPath.row].difficulty.rawValue
        return cell;
    }
    
}
