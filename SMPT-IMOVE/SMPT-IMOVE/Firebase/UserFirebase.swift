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
    static func publish(UserId id:String!, Event event:Event) {
         FirebaseConfig.ref.child("users/\(id!)").child("Events").child(event.eventName).setValue(event.toDictionary());
      //  FirebaseConfig.ref.child("users/\(id!)").child("Events").child("Event name:").setValue(event.eventName);
       // FirebaseConfig.ref.child("users/\(id!)").child("Events").child("Location name:").setValue(event.locationName);
       // FirebaseConfig.ref.child("users/\(id!)").child("Events").child("Descriptions:").setValue(event.eventDescription);
       
    }
    static func publish(Event event:Event) {
        FirebaseConfig.ref.child("Events").child(event.eventName).setValue(event.toDictionary());
    
    }
}
