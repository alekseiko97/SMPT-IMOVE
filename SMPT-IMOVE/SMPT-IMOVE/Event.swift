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
    var time: String//probably will be changed
    var usersParticipating: [User]
    var locationCoordinates: CLLocationCoordinate2D
    var locationName: String
   
    
    init(name:String, description:String, date:Date,time:String,locCoord:CLLocationCoordinate2D,locName: String){
        self.eventName = name
        self.description = description
        self.date = date
        self.time = time
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
    
}
