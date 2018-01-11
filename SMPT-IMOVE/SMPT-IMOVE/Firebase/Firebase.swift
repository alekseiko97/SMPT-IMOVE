//
//  Firebase.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 21/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation
import Firebase

public class FirebaseConfig {
    static var ref: DatabaseReference! = Database.database().reference()
    static var handle: AuthStateDidChangeListenerHandle!
    
    static func openHandle() {
        FirebaseConfig.handle = Auth.auth().addStateDidChangeListener{(auth, user) in }
    }
    
    static func closeHandle() {
        Auth.auth().removeStateDidChangeListener(handle)
    }
}
