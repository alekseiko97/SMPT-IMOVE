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
    
    var username: String?
    var email: String?
    var password: String?
    var profilePicture: UIImage?
    var weight: Int?
    var lastWeight: Int?
    var goal: String?
    var friends: [User]
    var exercises: [Exercise]
    
    
    init(name:String, email:String){
        self.username = name
        self.email = email
        self.friends = []
        self.weight = 0
        self.exercises = []
    }
    
    
    
    func addNewFriend(friend: User) -> Bool{
    
        if self.friends.contains(where: { user -> Bool in
            if user.email == friend.email {
                return true
            }
            else {
                return false
            }
        })
        {
        return false
        }
        else{
            self.friends.append(friend)
            return true
        }
    }
    
    func setWeight(weight: Int){
        
        self.weight = weight
    }
    
    
}
