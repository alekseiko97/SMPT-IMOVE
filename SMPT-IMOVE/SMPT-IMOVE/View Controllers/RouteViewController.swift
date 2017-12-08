//
//  RouteViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 07/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import MapKit

class RouteViewController: UIViewController, MKMapViewDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var kmLabel: UILabel!
    
    var route: Route!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.add((route.trackDrawer.getPolyline())!)
        zoomToRoute()
        kmLabel.text = String(describing: route.kmRoute)
    }
    
//    @IBAction func walkButton(_ sender: Any) {
//        //performSegue(withIdentifier: "startRun", sender: self)
//    }
    
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
    

}
