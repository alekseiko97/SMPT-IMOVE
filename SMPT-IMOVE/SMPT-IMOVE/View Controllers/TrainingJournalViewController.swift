//
//  TrainingJournalViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import CoreData
import Firebase

class TrainingJournalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var totalDistance = 0.0
    
    @IBOutlet weak var tableview: UITableView!

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(3)
    }
    
    func getAmountOfKilometresPerDay() -> Double
    {
        let id = Auth.auth().currentUser?.uid
        FirebaseConfig.ref.child("users/\(id!)").child("Routes").observe(.childAdded, with: {snapshot in
            
            if let runHistoryObject = snapshot.value as? [String:AnyObject]{
                let distance = runHistoryObject["Distance"] as? Double
                self.totalDistance += distance!
            }
            print("Distance: \(self.totalDistance)")
            
        })
        return totalDistance
        
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let MapTrainingCell: MapTrainingJournalTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MapTrainingCell", for: indexPath) as! MapTrainingJournalTableViewCell
        let WorkoutTrainingCell: WorkoutTrainingJournalTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WorkoutTableCell", for: indexPath) as! WorkoutTrainingJournalTableViewCell
        let WeightTrainingCell: WeightInTrainingJournalTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WeightInTableCell", for: indexPath) as! WeightInTrainingJournalTableViewCell
        

        if(indexPath.row == 0)
        {
            self.tableview.rowHeight = 200
            MapTrainingCell.totalDistance = getAmountOfKilometresPerDay()
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
