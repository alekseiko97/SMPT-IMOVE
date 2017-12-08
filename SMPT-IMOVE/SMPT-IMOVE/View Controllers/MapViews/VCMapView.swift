//
//  VCMapView.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import MapKit

extension MapViewController {
    
    // 1
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? POI {
            let identifier = "POI"
            var view: MKAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
                
            } else {
                // 3
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.image = annotation.setPicture()
                view.isEnabled = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            
            return view
        }
        return nil
    }
    
    // annotation callout opens this mapItem in Maps app
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! POI
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
}
