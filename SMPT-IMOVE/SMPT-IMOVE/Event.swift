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
    var time: String
    var usersParticipating: [User]
    var location: CLLocationCoordinate2D
   
    
    init(name:String, description:String, date:Date,time:String,location:CLLocationCoordinate2D){
        self.eventName = name
        self.description = description
        self.date = date
        self.time = time
        self.usersParticipating = []
        self.location = location
        
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
