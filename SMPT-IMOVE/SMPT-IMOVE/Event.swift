//
//  Event.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 30/11/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation

import UIKit
class Event {
    
    
    var eventName: String
    var description: String
    var date: Date
    var time: String
    var users: [User]
    
    
    init(name:String, description:String, date:Date,time:String){
        
        self.eventName = name
        self.description = description
        self.date = date
        self.time = time
        self.users = []
    }
    
}
