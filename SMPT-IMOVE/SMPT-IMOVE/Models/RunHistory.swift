//
//  RunHistory.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 12/01/2018.
//  Copyright © 2018 Fhict. All rights reserved.
//

import Foundation
import UIKit

class RunHistory
{
    var routeName: String
    var time: Int16
    var distance: Double
    var date: Date
    
    init(routeName: String, time: Int16, distance:Double, date:Date)
    {
        self.routeName = routeName
        self.time = time
        self.distance = distance
        self.date = date
    }
    
    func convertDateToString() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from:date)
        
        return dateString
    }
    
    func secondsToHoursMinutesSeconds() -> String {
        let hours = time / 3600
        let minutes = (time % 3600) / 60
        let seconds = (time % 3600) % 60
        return String(format:"%02d:%02d:%02d", hours, minutes, seconds);
    }
    
    func roundTo() -> Double {
        let divisor = pow(10.0, Double(2))
        return (distance / 1000 * divisor).rounded() / divisor
    }
    
    func toDictionary() -> [String:Any] {
        
        let runDictionary: [String:Any] = [
            "Route name":self.routeName,
            "Time": secondsToHoursMinutesSeconds(),
            "Distance": roundTo(),
            "Date": convertDateToString()
    ]
        return runDictionary
        
    }

}
