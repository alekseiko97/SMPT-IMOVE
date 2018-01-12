//
//  UserFirebase.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 21/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation
import Firebase

public class UserFirebase {
    static var user : User!
    
    static func logInUser(id: String, email: String, username: String?, weight: Weight?, goal:String?, gender:String?, age:Int?) {
        user = User(id: id, email: email)
    }
    
    static func registerUser(id: String, email:String) {
        user.id = id
        user.email = email
    }
    
    static func publish(UserId id:String!, Email email:String!) {
        FirebaseConfig.ref.child("users/\(id!)").child("Email").setValue(email);
    }
    
    static func publish(UserId id:String!, Username name:String!, Gender gender:String!, Age age:String!) {
        FirebaseConfig.ref.child("users/\(id!)").child("Username").setValue(name)
        FirebaseConfig.ref.child("users/\(id!)").child("Gender").setValue(gender)
        FirebaseConfig.ref.child("users/\(id!)").child("Age").setValue(age)
    }
    
    static func publish(UserId id:String!, Goal goal:String!) {
        FirebaseConfig.ref.child("users/\(id!)").child("Goal").setValue(goal);
    }
    
    static func publish(UserId id:String!, Route route: String!, Time time: String!, Distance distance: String!, Date date: String!)
    {
         FirebaseConfig.ref.child("users/\(id!)").child("Route").setValue(route);
         FirebaseConfig.ref.child("users/\(id!)").child("Time").setValue(time);
         FirebaseConfig.ref.child("users/\(id!)").child("Distance").setValue(distance);
         FirebaseConfig.ref.child("users/\(id!)").child("Date").setValue(date);
    }
    
    static func publish(id: String!, Run run:RunHistory) {
        FirebaseConfig.ref.child("users/\(id!)").child("Routes").child(run.convertDateToString()).setValue(run.toDictionary());
        
    }

}
