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

class EventViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
  
    var events : [Event] = []
    var selectedrow: Int = 0
    
    @IBOutlet weak var eventTableView: UITableView!
    
    
    // lattitudes and longitutes for 3 events location
    let eindhoven = CLLocationCoordinate2DMake(51.441955, 5.467501)
    let eindhoven2 = CLLocationCoordinate2DMake(51.426622, 5.481357)
    let eindhoven3 = CLLocationCoordinate2DMake(51.441722, 5.445506)
    
    
    //creating new 3 Event objects
    func CreateNewEvent(){
        let firstEvent = Event(
            name: "Strong legs",
            description: "Running and doing exercises",
            date: Date(timeIntervalSince1970: 1512835200),//using time converter,
            locCoord: eindhoven2,
            locName: "Stadswandelpark")
        events.append(firstEvent)
        
        let secondEvent = Event(
            name: "Running",
            description: "Running competition",
            date: Date(timeIntervalSince1970: 1512906323),//using time converter,
            locCoord: eindhoven3,
            locName: "Jacob Oppenheimerpark")
        events.append(secondEvent)
        
        let thirdEvent = Event(
            name: "Group competition",
            description: "Using bench and doing exercises",
            date: Date(timeIntervalSince1970: 1513103400),//using time converter,
            locCoord: eindhoven,
            locName: "Philips Stadium")
        events.append(thirdEvent)
    }
   
    override func viewDidLoad() {
       
        super.viewDidLoad()
        eventTableView.delegate = self
        eventTableView.dataSource = self
        CreateNewEvent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : EventTableViewCell = eventTableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventTableViewCell
        cell.lbl_EventName.text = String(describing: events[indexPath.row].eventName)
        cell.lbl_Location.text = String(describing: events[indexPath.row].locationName)
        cell.lbl_Date.text = events[indexPath.row].getDateAsString() + " " +  events[indexPath.row].getTimeAsString()
        cell.lbl_Description.text = String(describing: events[indexPath.row].description)
        return cell;
    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.selectedrow = indexPath.row
        performSegue(withIdentifier: "openEvent", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let selectedrow = self.eventTableView.indexPathForSelectedRow?.row ?? 0

        if segue.identifier == "openEvent" {
             let newViewController = segue.destination as? EventSingleViewController
       
            newViewController?.userChoseEvent = events[selectedrow]
        }
    }
}
