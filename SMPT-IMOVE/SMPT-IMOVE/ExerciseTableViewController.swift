//
//  ExerciseTableViewController.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 08/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

class ExerciseTableViewController: UITableViewController {
    
    var exercises: [String] = ["Bench exercises", "Running exercises","Breath exercises"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return exercises.count
    }

  
}
