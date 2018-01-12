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
    
    var id: String
    var username: String?
    var email: String
    var password: String?
    var profilePicture: UIImage?
    var weight : Weight?
    var goal: String?
    var gender: String?
    var age: Int?
    var friends: [User]?
    var exercises: [Exercise]?
    
    init(id:String, email:String) {
        self.id = id
        self.email = email
    }
    
    init(id:String, username:String, email:String, weight:Weight, goal:String) {
        self.id = id
        self.username = username
        self.email = email
        self.weight = weight
        self.goal = goal
    }
    
    init(id:String, name:String, email:String){
        self.id = id
        self.username = name
        self.email = email
        self.friends = []
        self.exercises = []
    }
    
    init(id:String, name:String, email:String, weight:Weight) {
        self.id = id
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
