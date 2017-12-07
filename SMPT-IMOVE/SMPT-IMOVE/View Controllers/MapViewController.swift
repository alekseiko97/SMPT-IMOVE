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

class MapViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource{
   
    //MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // Location manager
    let manager = CLLocationManager()
    let routes = [Route]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        mapView.addAnnotation(POI(title: "Sumatralaan Park", identifier: 1, coordinate: CLLocationCoordinate2D(latitude: 51.452386, longitude: 5.498089), type: .Park))
        mapView.addAnnotation(POI(title: "Event", identifier: 2, coordinate: CLLocationCoordinate2D(latitude: 51.450596, longitude: 5.462545), type: .Event))
        mapView.addAnnotation(POI(title: "DAF Museum", identifier: 3, coordinate: CLLocationCoordinate2D(latitude: 51.437301, longitude: 5.490603), type: .Sight))
        mapView.addAnnotation(POI(title: "Stadswandelpark", identifier: 4, coordinate: CLLocationCoordinate2D(latitude: 51.426731, longitude: 5.481262), type: .Park))
        mapView.addAnnotation(POI(title: "Philips de Jongh park", identifier: 5, coordinate: CLLocationCoordinate2D(latitude: 51.458151, longitude: 5.442765), type: .Park))
        mapView.addAnnotation(POI(title: "Henri Dunantpark", identifier: 6, coordinate: CLLocationCoordinate2D(latitude: 51.480282, longitude: 5.471652), type: .Park))
        mapView.addAnnotation(POI(title: "Philips van Lenneppark", identifier: 7, coordinate: CLLocationCoordinate2D(latitude: 51.446601, longitude: 5.430821), type: .Park))
        //trackDrawer = TrackDrawer(fileNames: ["test_route, Eindhoven"]);
        
        
        

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
