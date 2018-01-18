//
//  TrainingJournalMapTableViewCell.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase

class MapTrainingJournalTableViewCell: UITableViewCell, CLLocationManagerDelegate, MKMapViewDelegate
{
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var walkedLabel: UILabel!
    var locationManager: CLLocationManager = CLLocationManager()
    var totalDistance = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        locationManager.delegate = self
        mapView.delegate = self
        walkedLabel.text = "You've run 10.69 km today"
        //getAmountOfKilometresPerDay()
        //walkedLabel.text = String(getAmountOfKilometresPerDay())
        let lat = 51.44
        let lon = 5.48
        let coord = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let region = MKCoordinateRegionMakeWithDistance(coord, 5000, 5000)
        mapView.setRegion(region, animated: true)
    }
    
//    func getAmountOfKilometresPerDay() -> Double
//    {
//        let id = Auth.auth().currentUser?.uid
//        FirebaseConfig.ref.child("users/\(id!)").child("Routes").observe(.childAdded, with: {snapshot in
//
//            if let runHistoryObject = snapshot.value as? [String:AnyObject]{
//                let distance = runHistoryObject["Distance"] as? Double
//                self.totalDistance += distance!
//            }
//        })
//        print(self.totalDistance)
//
//        return totalDistance
//    }

    
}
