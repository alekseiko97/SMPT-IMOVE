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
    static var error : String!
    static var user : User!
    
    static func signIn(email:String, password:String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            (user, error) in
            if let error = error {
                UserFirebase.error = error.localizedDescription
            }
            if let user = user {
                
            }
        }
    }
}
