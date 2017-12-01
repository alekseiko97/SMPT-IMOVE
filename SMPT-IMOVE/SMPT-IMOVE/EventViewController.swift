///Users/natalya/Documents/SMPT-IMOVE/SMPT-IMOVE/SMPT-IMOVE
//  EventViewController.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import  CoreLocation

class EventViewController: UIViewController, CLLocationManagerDelegate {
    
    var events : [Event] = []
    //var lat = 51.441716
    //var long = 5.467684
    
    let eindhoven = CLLocationCoordinate2DMake(51.441716, 5.467684)
    
    //func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      //  let location:CLLocationCoordinate2D = manager.location!.coordinate
        //lat = (location.latitude)
        //long = (location.longitude)
    //}
    func createNewEvent(){
     let date = Date()
        //the date is current, need to be changed so a user can set it
        let calend = Calendar.current
        let hour = calend.component(.hour, from: date)
        let minutes = calend.component(.minute, from: date)
       
        let newEvent = Event(
            name: "Event 1",
            description: "Running and doing exercises",
            date: date, time: "12: 30",
            location: eindhoven)
        events.append(newEvent)
        print(events.count)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    


}
