//
//  RunRouteViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 08/12/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase

class RunRouteViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    
    private var run: Run!
    var userPolyline: MKPolyline!
    var canStartRun: Bool = false
    var route: Route!
    private var timer: Timer?
    private var seconds = 0
    private let locationManager = LocationManager.shared
    private var distance = Measurement(value: 0, unit: UnitLength.meters)
    private var locationList: [CLLocation] = []
    
    //App delegate
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopButton.isHidden = true
        self.mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        mapView.add(route.trackDrawer.getPolyline()!)
        makeRadiusOverlay()
        locationManager.startMonitoring(for: makeRegion())
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for newLocation in locations {
            let howRecent = newLocation.timestamp.timeIntervalSinceNow
            guard newLocation.horizontalAccuracy < 20 && abs(howRecent) < 10 else { continue }
            
            if let lastLocation = locationList.last {
                let delta = newLocation.distance(from: lastLocation)
                distance = distance + Measurement(value: delta, unit: UnitLength.meters)
                let coordinates = [lastLocation.coordinate, newLocation.coordinate]
                mapView.add(MKPolyline(coordinates: coordinates, count: 2))
                let region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 500, 500)
                mapView.setRegion(region, animated: true)
            }
            
            locationList.append(newLocation)
        }
        let region = MKCoordinateRegionMakeWithDistance(locations[0].coordinate, 500, 500)
        mapView.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }
    
    func makeRegion() -> CLCircularRegion
    {
        let region = CLCircularRegion(center: (route.trackDrawer.getPolyline()?.coordinate)!, radius: 500, identifier: route.identifier)
        region.notifyOnEntry = true
        region.notifyOnExit = true
        return region
    }
    
    func makeRadiusOverlay()
    {
        self.mapView.add(MKCircle(center: makeRegion().center, radius: makeRegion().radius))
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion)
    {
       // canStartRun = true
        print("enter")
        
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion)
    {
       // canStartRun = false
        print("exit")
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        if state == .inside
        {
            canStartRun = true
        }
        if state == .outside
        {
            canStartRun = false
            
        }
    }

    
    @IBAction func startTapped(_ sender: UIButton)
    {
//        if canStartRun == true
//        {
            startRun()
        //}
        
    }
    
    @IBAction func stopTapped(_ sender: UIButton)
    {
        let alertController = UIAlertController(title: "End run?",
                                                message: "Do you wish to end your run?",
                                                preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Save", style: .default) { _ in
            self.stopRun()
            self.saveRun()
            self.delegate.completedRouteRuns.append(self.route)
            self.performSegue(withIdentifier: "runDetails", sender: nil)
        })
        alertController.addAction(UIAlertAction(title: "Discard", style: .destructive) { _ in
            self.stopRun()
            _ = self.navigationController?.popViewController(animated: true)
        })
        
        present(alertController, animated: true)
    }
    
    
    @IBAction func cleanButton(_ sender: UIButton)
    {
      mapView.removeOverlays(mapView.overlays)
    }
    
    
    private func startRun() {
        startButton.isHidden = true
        stopButton.isHidden = false
        //mapView.removeOverlays(mapView.overlays)
        seconds = 0
        distance = Measurement(value: 0, unit: UnitLength.meters)
        locationList.removeAll()
        updateDisplay()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.eachSecond()
        }
        startLocationUpdates()
    }
    
    private func stopRun() {
        startButton.isHidden = false
        stopButton.isHidden = true
        timer?.invalidate()
        locationManager.stopUpdatingLocation()
    }
    
    private func saveRun() {
        let newRun = Run(context: CoreDataStack.context)
        newRun.distance = distance.value
        newRun.duration = Int16(seconds)
        newRun.timestamp = Date()
        
        for location in locationList {
            let locationObject = Location(context: CoreDataStack.context)
            locationObject.timestamp = location.timestamp
            locationObject.latitude = location.coordinate.latitude
            locationObject.longitude = location.coordinate.longitude
            newRun.addToLocations(locationObject)
        }
        
        CoreDataStack.saveContext()
        
        run = newRun
        
        let runHistory = RunHistory(routeName: route.nameRoute, time: newRun.duration, distance: newRun.distance, date: newRun.timestamp!)
        let id = Auth.auth().currentUser?.uid
        UserFirebase.publish(id: id, Run: runHistory)
    }
    
    func eachSecond() {                 
        seconds += 1
        updateDisplay()
    }
    
    private func updateDisplay() {
        let formattedDistance = FormatDisplay.distance(distance)
        let formattedTime = FormatDisplay.time(seconds)
        let formattedPace = FormatDisplay.pace(distance: distance,
                                               seconds: seconds,
                                               outputUnit: UnitSpeed.kilometersPerHour)
        
        distanceLabel.text = formattedDistance
        timeLabel.text = formattedTime
        paceLabel.text = formattedPace
    }
    
    private func startLocationUpdates() {
        locationManager.delegate = self
        locationManager.activityType = .fitness
        locationManager.distanceFilter = 5
        locationManager.startUpdatingLocation()
    }
    
   
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let polyline = overlay as? MKPolyline else {
            return MKOverlayRenderer(overlay: overlay)
        }
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.strokeColor = .black
        renderer.lineWidth = 3
        return renderer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "runDetails"
        {
            let destination = segue.destination as! RunOverviewViewController
            destination.run = self.run
        }
    }
    
    
}
