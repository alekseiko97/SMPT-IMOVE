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

class MapTrainingJournalTableViewCell: UITableViewCell, CLLocationManagerDelegate, MKMapViewDelegate
{
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager = CLLocationManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()

        locationManager.delegate = self
        mapView.delegate = self
        
        let lat = 51.44
        let lon = 5.48
        let coord = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let region = MKCoordinateRegionMakeWithDistance(coord, 5000, 5000)
        
        mapView.setRegion(region, animated: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
