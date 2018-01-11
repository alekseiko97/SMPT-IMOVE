//
//  TrainingJournalViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import CoreData

class TrainingJournalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tableview: UITableView!
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        var height:CGFloat = CGFloat()
//                if indexPath.row == 1 {
//                    height = 250
//                }
//                else if indexPath.row == 2 {
//                    height = 150
//                }
//                else
//                {
//                    height = 50
//                }
//        return height
//    }
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
            self.tableview.rowHeight = 200
            //MapTrainingCell.textLabel?.text = MapTrainingTest[0]
            return(MapTrainingCell)
        }

        else if(indexPath.row == 1)
        {
            self.tableview.rowHeight = 155
            //WorkoutTrainingCell.textLabel?.text = WorkoutTest[0]
            return(WorkoutTrainingCell)
        }
        else
        {
            self.tableview.rowHeight = 44
            //WeightTrainingCell.textLabel?.text = WeightTest[0]
            return(WeightTrainingCell)
        }
        
        //MapTrainingCell.mapView.add(delegate.completedRouteRuns[indexPath.row].trackDrawer.getPolyline()!)
        
    }
    
    private func getRuns() -> [Run] {
        let fetchRequest: NSFetchRequest<Run> = Run.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Run.timestamp), ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            return try CoreDataStack.context.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        //self.tableview.rowHeight = 200

//        self.tableview.rowHeight = UITableViewAutomaticDimension
//        self.tableview.estimatedRowHeight = 150
//        self.tableview.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
