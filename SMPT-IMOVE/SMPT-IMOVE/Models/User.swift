//
//  User.swift
//  SMPT-IMOVE
//
//  Created by Natalya Suslova on 30/11/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation
import UIKit
class User {
    
    var username: String
    var email: String
    var password: String?
    var profilePicture: UIImage?
    var weight : Weight?
    var goal: String?
    var friends: [User]
    var exercises: [Exercise]
    
    
    init(name:String, email:String){
        self.username = name
        self.email = email
        self.friends = []
        self.exercises = []
    }
    
    init(name:String, email:String, weight:Weight) {
        self.username = name
        self.email = email
        self.weight = weight
        self.friends = []
        self.exercises = []
    }
    
    func setWeight(newWeight:Double) {
        self.weight = Weight(currentWeight: newWeight)
    }
}

var user = User(name: "Shadowphoenix", email: "fontys@shadowphoenix.nl", weight: Weight(currentWeight: 57.5))
