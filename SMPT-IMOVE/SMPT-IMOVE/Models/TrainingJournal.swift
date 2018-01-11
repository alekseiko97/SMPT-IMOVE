//
//  TrainingJournal.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 01/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation
import  CoreLocation
import UIKit
class TrainingJournal {
    
    var quote: Quote?
    var exercise:Exercise
    var km: Double
    var date:Date
    var startTime: String
    var endTime: String
    var location: CLLocationCoordinate2D
    
    
    init(quote:Quote, exerc:Exercise, date:Date,km:Double,startT: String, endT:String,location: CLLocationCoordinate2D){
        
        //self.quote = quote
        self.quote = Quotes[randomNumber]
        self.exercise = exerc
        self.date = date
        self.km = km
        self.startTime = startT
        self.endTime = endT
        self.location = location
    }
}
