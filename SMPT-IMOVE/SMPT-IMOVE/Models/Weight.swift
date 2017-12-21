//
//  Weight.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 14/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation

class Weight {
    var currentWeight: Double
    
    init(currentWeight:Double) {
        self.currentWeight = currentWeight
    }
    
    class func calcWeeklyAverage() -> Double {
        // Get list of weights from db with current date as parameter
        var weekWeights = Array<Weight>()
        
        weekWeights.append(Weight(currentWeight: 57.5));
        weekWeights.append(Weight(currentWeight: 57.6));
        weekWeights.append(Weight(currentWeight: 57.9));
        weekWeights.append(Weight(currentWeight: 58.2));
        weekWeights.append(Weight(currentWeight: 58.0));
        weekWeights.append(Weight(currentWeight: 58.6));
        weekWeights.append(Weight(currentWeight: 58.1));
        
        return self.calcAverage(weightArray: weekWeights)
    }
    
    func calcMonthlyAverage() {
        // Get list of weights from db with current date as parameters
        // return self.calcAverage(weightArray: monthWeights)
    }
    
    class func calcAverage(weightArray:Array<Weight>) -> Double {
        var totalWeight = 0.0
        for weight in weightArray {
            totalWeight += weight.currentWeight
        }
        return totalWeight / Double(weightArray.count) - (weightArray.last?.currentWeight)!
    }
}
