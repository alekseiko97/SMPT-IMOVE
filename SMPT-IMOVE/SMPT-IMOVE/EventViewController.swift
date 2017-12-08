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
    var timeString = ""
    var dateString = ""
    var events : [Event] = []
    var selectedrow: Int = 0
    
    @IBOutlet weak var eventTableView: UITableView!
    
    let eindhoven = CLLocationCoordinate2DMake(51.441716, 5.467684)
    let eindhoven2 = CLLocationCoordinate2DMake(51.450596, 5.462545)
    
    func CreateNewEvent(){
        let newEvent = Event(
            name: "Strong legs",
            description: "Running and doing exercises",
            date: Date(timeIntervalSince1970: 1512835200),
            locCoord: eindhoven2,
            locName: "Central Park")
        
        events.append(newEvent)
        print(events.count)
        
        let newsecondEvent = Event(
            name: "Group competition",
            description: "Using bench and doing exercises",
            date: Date(timeIntervalSince1970: 1513103400),
            locCoord: eindhoven,
            locName: "Kids Park")
        
        events.append(newsecondEvent)
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
        cell.lbl_Date.text = events[indexPath.row].getDateAsString()
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
