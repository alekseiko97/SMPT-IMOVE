//
//  Event.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 30/11/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation
import  CoreLocation
import UIKit
class Event {
    
    
    var eventName: String
    var description: String
    var date: Date

    var usersParticipating: [User]
    var locationCoordinates: CLLocationCoordinate2D
    var locationName: String
   
    
    init(name:String, description:String, date:Date,locCoord:CLLocationCoordinate2D,locName: String){
        self.eventName = name
        self.description = description
        self.date = date

        self.usersParticipating = []
        self.locationCoordinates = locCoord
        self.locationName = locName
        
    }
    
    func addUserToTheEvent(user:User){
        
        self.usersParticipating.append(user)
    }
    
    func showAllUsersForTheEvent() -> Int {
        return self.usersParticipating.count
        
    }
    
    func removeUserFromTheEvent(user:User){
        
    }

    func getTimeAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
    
        return formatter.string(from: date)
    }
    
    func getDateAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none

        return formatter.string(from: date)
    }
}
