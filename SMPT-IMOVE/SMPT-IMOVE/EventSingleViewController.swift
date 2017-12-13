//
//  EventSingleViewController.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 07/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class EventSingleViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate, UITableViewDelegate,UITableViewDataSource {
    
     let manager = CLLocationManager()
     var userChoseEvent: Event?
   
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var dateEvent: UILabel!
    @IBOutlet weak var mapLocation: MKMapView!
    @IBOutlet weak var locationEvent: UILabel!
    @IBOutlet weak var timeEvent: UILabel!
    @IBOutlet weak var workoutEvent: UILabel!
    @IBOutlet weak var workoutTableView: UITableView!
    
    //examples for exercises
    var exercises: [String] = ["Bench exercises", "Running exercises","Breath exercises"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //assigning the information of the event to the labels of the screen
        if let showEvent = userChoseEvent {
            self.eventName.text = showEvent.eventName
            self.timeEvent.text = showEvent.getTimeAsString()
            self.dateEvent.text = showEvent.getDateAsString()
            self.locationEvent.text = String(showEvent.locationName)
            self.mapLocation.addAnnotation(POI(title: showEvent.locationName, identifier: 1, coordinate:showEvent.locationCoordinates, type: .Park))
        }
        workoutTableView.delegate = self
        workoutTableView.dataSource = self
        
        mapLocation.delegate = self
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        zoomToEvent()
    }
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

       let location = locations[0]
       let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 5000, 5000)
       mapLocation.setRegion(region, animated: true)
       self.mapLocation.showsUserLocation = true
    }
    
    func zoomToEvent() {
        let region = MKCoordinateRegionMakeWithDistance((userChoseEvent?.locationCoordinates)!, 1000, 1000)
        mapLocation.setRegion(region, animated: true)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ExerciseTableViewCell = workoutTableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as! ExerciseTableViewCell
        cell.lbl_Exercise.text = String(describing:exercises[indexPath.row])
        return cell;
}


}
