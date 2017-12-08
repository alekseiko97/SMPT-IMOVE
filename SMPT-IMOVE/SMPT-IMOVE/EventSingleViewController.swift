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

class EventSingleViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate, UITableViewDelegate {
    
     let manager = CLLocationManager()
     var userChoseEvent: Event?
     let eindhoven = CLLocationCoordinate2DMake(51.441716, 5.467684)
    
    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var dateEvent: UILabel!
    @IBOutlet weak var mapLocation: MKMapView!
    
    @IBOutlet weak var locationEvent: UILabel!
    @IBOutlet weak var timeEvent: UILabel!
    @IBOutlet weak var workoutEvent: UILabel!
    
    @IBOutlet weak var workoutTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let showEvent = userChoseEvent {
            self.eventName.text = showEvent.eventName
            self.timeEvent.text = showEvent.getTimeAsString()
            self.dateEvent.text = showEvent.getDateAsString()
            self.locationEvent.text = String(showEvent.locationName)
            self.mapLocation.addAnnotation(POI(title: showEvent.locationName, identifier: 1, coordinate:showEvent.locationCoordinates, type: .Park))
           
        }
 
        
       
        mapLocation.delegate = self
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
       
       

        // Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 5000, 5000)
        mapLocation.setRegion(region, animated: true)
        self.mapLocation.showsUserLocation = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
