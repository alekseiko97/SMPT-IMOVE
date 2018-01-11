//
//  RouteViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 07/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import MapKit

class RouteViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Outlets

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var kmLabel: UILabel!
    
    var route: Route!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.add((route.trackDrawer.getPolyline())!)
        mapView.addAnnotations(route.objects)
        zoomToRoute()
        //kmLabel.text = String(route.kmRoute)
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
    
    func zoomToRoute()
    {
        let region = MKCoordinateRegionMakeWithDistance((route.trackDrawer.getPolyline()?.coordinate)!, 500, 500)
        mapView.setRegion(region, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "runSegue"
        {
            let destVC = segue.destination as! RunRouteViewController
            destVC.route = self.route
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Object {
            let identifier = "Object"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            
            
            return view
        }
        return nil
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "objectCell", for: indexPath) as? ObjectTableViewCell else {
            fatalError("The dequeued cell is not an instance of TableViewCell.")
        }
        
        //cell.objectNameLabel.text = route
        cell.objectNameLabel.text = route.objects[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return route.objects.count
    }

    // annotation callout opens this mapItem in Maps app
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        performSegue(withIdentifier: "objectVCSegue", sender: self)

    }
    
}


