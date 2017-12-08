//
//  Route.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation
import  CoreLocation
import UIKit
class Route {
    
    var nameRoute: String?
    var kmRoute: Double?
    var events: [Event]
    var location: CLLocationCoordinate2D
    
    init(nameR: String, kmR:Double, location:CLLocationCoordinate2D ){
        self.nameRoute = nameR
        self.kmRoute = kmR
        self.events = []
        self.location = location
    }
    
    
    
}
