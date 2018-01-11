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
import Firebase

//for showing address when a user chooses a location on the map
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
    
    @IBOutlet weak var tb_descriptionEvent: UITextField!
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
        let lat = eventCoordinates.latitude
        let lng = eventCoordinates.longitude
        
        // Create Location
        let location = CLLocation(latitude: lat, longitude: lng)
        
        // Geocode Location
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            // Process Response
            if let error = error {
                print("Unable to Reverse Geocode Location (\(error))")
            } else {
               // print(#function, placemarks?.first?.compactAddress ?? "Default")
                
                let name = self.tb_eventName.text ?? ""
                let desc = self.tb_descriptionEvent.text ?? ""
                
                if (name.isEmpty || desc.isEmpty)  {
                    self.createAlert(title: "Alert", message: "Please fill in all the fields!")
                }
                else {
                    let newEvent = Event(
                        name: name,
                        evDescription:desc,
                        date: self.dateTimePicker.date,//taken from the datepicker
                        locCoord:  self.eventCoordinates,
                        locName: placemarks?.first?.compactAddress ?? "Default")
                    self.eventsList.append(newEvent)
                    print(newEvent.description)
                //   let id = Auth.auth().currentUser?.uid
                //UserFirebase.publish(UserId: id, Event: newEvent)
                     UserFirebase.publish(Event: newEvent)
              
                    
                    
                }
            }
        }
    }
    //if the field event name is empty,an alert message is shown
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
        alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert,animated:true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
    }
    
    @IBAction func addPin(_ sender: UILongPressGestureRecognizer) {
        let touchLocation = sender.location(in: self.mapView)
        let locationCoordinate = self.mapView.convert(touchLocation, toCoordinateFrom: mapView)
        eventCoordinates = CLLocationCoordinate2DMake(locationCoordinate.latitude, locationCoordinate.longitude)
        
        //inserts all annotations, removes the previous and takes only the last
        for annotation in mapView.annotations {
            mapView.removeAnnotation(annotation)
        }
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

    
    @objc func donePressed(){
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .short
        dateformatter.timeStyle = .short
        tb_DateTime.text = dateformatter.string(from: dateTimePicker.date)
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}
