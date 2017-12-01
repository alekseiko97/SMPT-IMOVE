//
//  POI.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation
import UIKit
import MapKit

enum TypeOfPOI
{
    case Park
    case Object
    case Friend
    case Sight // place in the city to see
    case Event
}

class POI: NSObject, MKAnnotation {
    
    var title: String?
    var identifier: Int
    var coordinate: CLLocationCoordinate2D
    var type: TypeOfPOI
    
    init(title: String, identifier: Int, coordinate: CLLocationCoordinate2D, type: TypeOfPOI) {
        
     self.title = title
     self.identifier = identifier
     self.coordinate = coordinate
     self.type = type
        
        
    super.init()
    }
    
}
