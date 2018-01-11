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
import Firebase

class EventViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
  var ref: DatabaseReference? = nil
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
            evDescription: "Running and doing exercises",
            date: Date(timeIntervalSince1970: 1516871700),//using time converter,
            locCoord: eindhoven2,
            locName: "Stadswandelpark")
        events.append(firstEvent)
        
        let secondEvent = Event(
            name: "Running",
            evDescription: "Running competition",
            date: Date(timeIntervalSince1970: 1517408100),//using time converter,
            locCoord: eindhoven3,
            locName: "Jacob Oppenheimerpark")
        events.append(secondEvent)
        
        let thirdEvent = Event(
            name: "Group competition",
            evDescription: "Using bench and doing exercises",
            date: Date(timeIntervalSince1970: 1517487300),//using time converter,
            locCoord: eindhoven,
            locName: "Philips Stadium")
        events.append(thirdEvent)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTableView.delegate = self
        eventTableView.dataSource = self
        CreateNewEvent()
         let id = Auth.auth().currentUser?.uid
        ref = Database.database().reference().child(id!).child("Events")
        ref?.observe(.childAdded,with: { snapshot in
            for Events in snapshot.children.allObjects as! [DataSnapshot]
            {
                if let eventObject = Events.value as? [String:Any],
                    let nameEvent = eventObject["Name event"] as? String,
                    let coordinates = eventObject["Coordinates"] as? CLLocationCoordinate2D,
                    let desc = eventObject["Description"] as? String,
                    let nameLoc = eventObject["Location"] as? String,
                    let date = eventObject["Date"] as? Date
                {
                    let databaseEvent =  Event(name: nameEvent, evDescription: desc, date: date, locCoord: coordinates, locName: nameLoc)
                print(databaseEvent)
                }
            }
        })
        
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
        cell.lbl_Description.text = String(describing: events[indexPath.row].eventDescription)
        return cell;
    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       self.selectedrow = indexPath.row
        performSegue(withIdentifier: "openEvent", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openEvent" {
             let newViewController = segue.destination as? EventSingleViewController
             newViewController?.userChoseEvent = events[selectedrow]
        }
    }
}
