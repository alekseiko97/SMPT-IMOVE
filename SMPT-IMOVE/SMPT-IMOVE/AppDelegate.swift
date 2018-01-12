//
//  AppDelegate.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 30/11/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var completedRouteRuns:[Route] = []

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.statusBarStyle = .lightContent
        let locationManager = LocationManager.shared
        locationManager.requestWhenInUseAuthorization()
        FirebaseApp.configure()
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        CoreDataStack.saveContext()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataStack.saveContext()
    }


}

