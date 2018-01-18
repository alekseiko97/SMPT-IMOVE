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
class Route {
    
    var identifier: String
    var nameRoute: String
    var kmRoute: Double
    var trackDrawer: TrackDrawer
    var objects: [Object]
    
    init(identifier: String, nameR: String, kmR:Double){
        self.identifier = identifier
        self.nameRoute = nameR
        self.kmRoute = kmR
        self.trackDrawer = TrackDrawer(fileName: nameR)
        self.objects = []
    }
    
    func addObjectToRoute(object: Object)
    {
        self.objects.append(object)
    }
    
}
