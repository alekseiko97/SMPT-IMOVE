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

extension CLPlacemark {
    
    var compactAddress: String? {
        if let name = name {
            var result = name
            
            if let street = thoroughfare {
                result += ", \(street)"
            }
            
            if let city = locality {
                result += ", \(city)"
            }
            
            if let country = country {
                result += ", \(country)"
            }
            
            return result
        }
        
        return nil
    }
    
}
class AddEventViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tb_eventName: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tb_DateTime: UITextField!
    
    @IBOutlet weak var tb_workout: UITextField!
    let dateTimePicker : UIDatePicker = UIDatePicker()
    lazy var geocoder = CLGeocoder()
    var eventCoordinates = CLLocationCoordinate2DMake(0,0)
    var eventsList: [Event] = []
    let manager = CLLocationManager()
    
    @IBAction func addEvent(_ sender: Any) {
        let newEvent = Event(
            name: String(describing: tb_eventName.text),
            evDescription: "Running and doing exercises",//will be taken from the user input
            date: dateTimePicker.date,
            locCoord:  self.eventCoordinates,
          //  locName: "Stadswandelpark")//need to be added to the screen
            locName:)
       self.eventsList.append(newEvent)
        print(newEvent.description)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
    }
    
    func geocode() {
         let lat = eventCoordinates.latitude
         let lng = eventCoordinates.longitude
        
        // Create Location
        let location = CLLocation(latitude: lat, longitude: lng)
        
        // Geocode Location
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            // Process Response
            processResponse(withPlacemarks: placemarks, error: error)
        }
        func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
            // Update View
            
            
            if let error = error {
                print("Unable to Reverse Geocode Location (\(error))")
                
                
            } else {
                if let placemarks = placemarks, let placemark = placemarks.first {
                    
                } else {
                    
                }
            }
        }
        
    }
    
    
    @IBAction func revealRegionDetailsWithLongPressOnMap(sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizerState.began { return }
        let touchLocation = sender.location(in: mapView)
        let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
        eventCoordinates = CLLocationCoordinate2DMake(locationCoordinate.latitude, locationCoordinate.longitude)
        
        //inserts all annotatuons, need to remove the previous, and leave the Last
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: eventCoordinates.latitude, longitude: eventCoordinates.longitude)
        mapView.addAnnotation(annotation)
    }
    func createDatePicker(){
        
        dateTimePicker.datePickerMode = .dateAndTime
    let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let donebutton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([donebutton], animated: false)
        tb_DateTime.inputAccessoryView = toolbar
        tb_DateTime.inputView = dateTimePicker
    }
    //need to be checked
    @objc func donePressed(){
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .short
        dateformatter.timeStyle = .short
        tb_DateTime.text = dateformatter.string(from: dateTimePicker.date)
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //let dateTimePicker : UIDatePicker = UIDatePicker()
       // dateTimePicker.datePickerMode = UIDatePickerMode.dateAndTime
       // tb_DateTime.inputView = dateTimePicker
        createDatePicker()
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
       let location = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
       print("\(location.latitude), \(location.longitude)")
    }
}
