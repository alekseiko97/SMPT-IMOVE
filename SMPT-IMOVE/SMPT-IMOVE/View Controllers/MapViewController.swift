//
//  MapViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate,  UITableViewDataSource{
   
    //MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // Location manager
    let manager = CLLocationManager()
    let routes = [Route]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 5000, 5000)
        mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return routes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "routeCell", for: indexPath) as? RouteTableViewCell else {
            fatalError("The dequeued cell is not an instance of TableViewCell.")
        }
        
        cell.routeLabel.text = routes[indexPath.row].nameRoute
        let km = String(format:"%f", routes[indexPath.row].kmRoute!)
        cell.kmLabel.text = km
        
        return cell
    }
    
    
    
    
    

}
