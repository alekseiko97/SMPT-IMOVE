//
//  AddEventViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 07/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class AddEventViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tb_eventName: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tb_DateTime: UITextField!
    
    
    var newEvent = CLLocationCoordinate2DMake(0,0)
    var eventsList: [Event] = []
    let manager = CLLocationManager()
    
    @IBAction func addEvent(_ sender: Any) {
        let newEvent = Event(
            name: String(describing: tb_eventName.text),
            description: "Running and doing exercises",
            date: Date(timeIntervalSince1970: 1512835200),//using time converter,
            locCoord:  self.newEvent,
            locName: "Stadswandelpark")
       self.eventsList.append(newEvent)
       print(newEvent.locationCoordinates)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 5000, 5000)
        mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
    }
    
    @IBAction func revealRegionDetailsWithLongPressOnMap(sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizerState.began { return }
        let touchLocation = sender.location(in: mapView)
        let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
        newEvent = CLLocationCoordinate2DMake(locationCoordinate.latitude, locationCoordinate.longitude)
        
        //inserts all annotatuons, need to remove the previous, and leave the Last
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: newEvent.latitude, longitude: newEvent.longitude)
        mapView.addAnnotation(annotation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateTimePicker : UIDatePicker = UIDatePicker()
        dateTimePicker.datePickerMode = UIDatePickerMode.dateAndTime
        tb_DateTime.inputView = dateTimePicker
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func handleGesture(gestureRecognizer:UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: self.mapView)
       // let location = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
       //print("\(location.latitude), \(location.longitude)")
    }
}
