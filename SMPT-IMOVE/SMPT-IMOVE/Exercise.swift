//
//  Exercise.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 30/11/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation
import UIKit
class Exercise{
    
    var exerciseName: String
    var muscleGroup: String
    var keyPoints: String
    var difficulty: LevelOfDifficulty
    
    
    init(exercName: String, muscleGroup: String, keyPoints: String, difficulty: LevelOfDifficulty){
        
        self.exerciseName = exercName
        self.muscleGroup = muscleGroup
        self.keyPoints = keyPoints
        self.difficulty = difficulty
        
    }
    
    
    
}
