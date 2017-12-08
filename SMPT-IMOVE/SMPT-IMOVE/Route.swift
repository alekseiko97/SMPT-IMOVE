//
//  Route.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation
import MapKit
import UIKit
class Route{
    
    var nameRoute: String?
    var kmRoute: Double?
    var trackDrawer: TrackDrawer
    //var polyline: MKPolyline
    var events: [Event]
    
    init(nameR: String, kmR:Double){
        self.nameRoute = nameR
        self.kmRoute = kmR
        self.trackDrawer = TrackDrawer(fileName: nameR)
        //self.polyline = trackDrawer.getPolyline()!
        self.events = []
    }
    

    
    
    
}
