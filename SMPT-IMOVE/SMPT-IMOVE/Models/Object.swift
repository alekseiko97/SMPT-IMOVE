//
//  Object.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 15/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class Object: NSObject, MKAnnotation
{
    var title: String?
    //var type: Object_Exercise
    var coordinate: CLLocationCoordinate2D
    var exercises: [Exercise]
    
    init(title: String, coordinate: CLLocationCoordinate2D)
    {
        self.title = title
        //self.type = type
        self.coordinate = coordinate
        self.exercises = []
        
        super.init()
    }
    
    func addExerciseToObject(exercise: Exercise)
    {
        self.exercises.append(exercise)
    }
    
   
    
    func mapItem() -> MKMapItem {
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
//        switch type {
//        case .Bar:
//            mapItem.name = "Bar"
//        case .Bench:
//            mapItem.name = "Bench"
//        case .Treetrunk:
//            mapItem.name = "Treetrunk"
//        }
        mapItem.name = title
        
        return mapItem
    }
    
    
}


