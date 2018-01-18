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

class MapViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate{
   
    //MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // Location manager
    let manager = CLLocationManager()
    var routes = [Route]()
    var selectedrow: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        loadPOI()
        addRoutes()
        
    }
    
    func addRoutes()
    {
        let testRoute = Route(identifier: "1", nameR: "TestRoute", kmR: 7.2)
        testRoute.addObjectToRoute(object: Object(title: "Bench", coordinate: CLLocationCoordinate2D(latitude: 51.452319, longitude: 5.497161)))
        testRoute.addObjectToRoute(object: Object(title: "Treetrunk", coordinate: CLLocationCoordinate2D(latitude: 51.452095, longitude: 5.498478)))
        routes.append(testRoute)
        routes.append(Route(identifier: "2", nameR: "Glorieuxpark", kmR: 4.82))
        routes.append(Route(identifier: "3", nameR: "Genneperpark zigzag", kmR: 7.58))
    }
    
    func loadPOI()
    {
        mapView.addAnnotation(POI(title: "Sumatralaan Park", identifier: 1, coordinate: CLLocationCoordinate2D(latitude: 51.452386, longitude: 5.498089), type: .Park))
        mapView.addAnnotation(POI(title: "Event", identifier: 2, coordinate: CLLocationCoordinate2D(latitude: 51.450596, longitude: 5.462545), type: .Event))
        mapView.addAnnotation(POI(title: "DAF Museum", identifier: 3, coordinate: CLLocationCoordinate2D(latitude: 51.437301, longitude: 5.490603), type: .Sight))
        mapView.addAnnotation(POI(title: "Stadswandelpark", identifier: 4, coordinate: CLLocationCoordinate2D(latitude: 51.426731, longitude: 5.481262), type: .Park))
        mapView.addAnnotation(POI(title: "Philips de Jongh park", identifier: 5, coordinate: CLLocationCoordinate2D(latitude: 51.458151, longitude: 5.442765), type: .Park))
        mapView.addAnnotation(POI(title: "Henri Dunantpark", identifier: 6, coordinate: CLLocationCoordinate2D(latitude: 51.480282, longitude: 5.471652), type: .Park))
        mapView.addAnnotation(POI(title: "Philips van Lenneppark", identifier: 7, coordinate: CLLocationCoordinate2D(latitude: 51.446601, longitude: 5.430821), type: .Park))
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 5000, 5000)
        mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
        manager.stopUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
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
        let km = String(routes[indexPath.row].kmRoute)
        cell.kmLabel.text = km
        
        return cell
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let polyline = overlay as? MKPolyline else {
            return MKOverlayRenderer(overlay: overlay)
        }
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.strokeColor = .black
        renderer.lineWidth = 3
        return renderer
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "routeSegue"
        {
            if let indexPath = tableView.indexPathForSelectedRow
            {
            let destVC = segue.destination as! RouteViewController
            destVC.route = routes[indexPath.row]
            }
        }
        
    }
    

    
    

    

}
