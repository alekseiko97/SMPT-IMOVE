///Users/natalya/Documents/SMPT-IMOVE/SMPT-IMOVE/SMPT-IMOVE
//  EventViewController.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class EventViewController: UIViewController, CLLocationManagerDelegate {
    
    var events : [Event] = []
    
    let eindhoven = CLLocationCoordinate2DMake(51.441716, 5.467684)

    func createNewEvent(){
     let date = Date()
        //the date is current, need to be changed so a user can set it
        let calend = Calendar.current
        let hour = calend.component(.hour, from: date)
        let minutes = calend.component(.minute, from: date)
       
        //first try to create an object of Event, later needs to try with data from the fields
        let newEvent = Event(
            name: "Event 1",
            description: "Running and doing exercises",
            date: date,
            time: "12: 30",
            locCoord: eindhoven,
            locName: "Central Park")
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
