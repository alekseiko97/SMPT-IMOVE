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
class Event: CustomStringConvertible {
    
    
    var eventName: String
    var eventDescription: String
    var date: Date
    var usersParticipating: [User]
    var locationCoordinates: CLLocationCoordinate2D
    var locationName: String
    var workoutExercises: [Exercise]
    
   
    
    init(name:String, evDescription:String, date:Date,locCoord:CLLocationCoordinate2D,locName: String){
        self.eventName = name
        self.eventDescription = evDescription
        self.date = date
        self.usersParticipating = []
        self.locationCoordinates = locCoord
        self.locationName = locName
        self.workoutExercises = []
        
    }
    func addExerciseToTheWorkout(exerc:Exercise){
        
        self.workoutExercises.append(exerc)
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
    

    var description: String {
        return "name event: \(eventName)\("\n")description: \(eventDescription)\("\n")when: \(date)\("\n")location: \(locationCoordinates)\("\n")"
    }
   
    //for easy way to send data into database
    func toDictionary() -> [String:Any] {
        let coordin : [String:Any] = [
            "latitdude":self.locationCoordinates.latitude,
            "longitude":self.locationCoordinates.longitude]
        
      
        let eventDictionary: [String:Any] = [
            "Name event":self.eventName,
            "Location": self.locationName,
            "Date":getDateAsString(),
            "Time":getTimeAsString(),
            "Description": self.eventDescription,
            "Coordinates": coordin]
        return eventDictionary
        
    }
}
