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
            self.performSegue(withIdentifier: "", sender: nil)
        })
        alertController.addAction(UIAlertAction(title: "Discard", style: .destructive) { _ in
            self.stopRun()
            _ = self.navigationController?.popViewController(animated: true)
        })
        
        present(alertController, animated: true)
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
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
    }
    
    private func polyLine() -> [MulticolorPolyline] {
        
        // 1
        let locations = run.locations?.array as! [Location]
        var coordinates: [(CLLocation, CLLocation)] = []
        var speeds: [Double] = []
        var minSpeed = Double.greatestFiniteMagnitude
        var maxSpeed = 0.0
        
        // 2
        for (first, second) in zip(locations, locations.dropFirst()) {
            let start = CLLocation(latitude: first.latitude, longitude: first.longitude)
            let end = CLLocation(latitude: second.latitude, longitude: second.longitude)
            coordinates.append((start, end))
            
            //3
            let distance = end.distance(from: start)
            let time = second.timestamp!.timeIntervalSince(first.timestamp! as Date)
            let speed = time > 0 ? distance / time : 0
            speeds.append(speed)
            minSpeed = min(minSpeed, speed)
            maxSpeed = max(maxSpeed, speed)
        }
        
        //4
        let midSpeed = speeds.reduce(0, +) / Double(speeds.count)
        
        //5
        var segments: [MulticolorPolyline] = []
        for ((start, end), speed) in zip(coordinates, speeds) {
            let coords = [start.coordinate, end.coordinate]
            let segment = MulticolorPolyline(coordinates: coords, count: 2)
            segment.color = segmentColor(speed: speed,
                                         midSpeed: midSpeed,
                                         slowestSpeed: minSpeed,
                                         fastestSpeed: maxSpeed)
            segments.append(segment)
        }
        return segments
    }
    
    private func segmentColor(speed: Double, midSpeed: Double, slowestSpeed: Double, fastestSpeed: Double) -> UIColor {
        enum BaseColors {
            static let r_red: CGFloat = 1
            static let r_green: CGFloat = 20 / 255
            static let r_blue: CGFloat = 44 / 255
            
            static let y_red: CGFloat = 1
            static let y_green: CGFloat = 215 / 255
            static let y_blue: CGFloat = 0
            
            static let g_red: CGFloat = 0
            static let g_green: CGFloat = 146 / 255
            static let g_blue: CGFloat = 78 / 255
        }
        
        let red, green, blue: CGFloat
        
        if speed < midSpeed {
            let ratio = CGFloat((speed - slowestSpeed) / (midSpeed - slowestSpeed))
            red = BaseColors.r_red + ratio * (BaseColors.y_red - BaseColors.r_red)
            green = BaseColors.r_green + ratio * (BaseColors.y_green - BaseColors.r_green)
            blue = BaseColors.r_blue + ratio * (BaseColors.y_blue - BaseColors.r_blue)
        } else {
            let ratio = CGFloat((speed - midSpeed) / (fastestSpeed - midSpeed))
            red = BaseColors.y_red + ratio * (BaseColors.g_red - BaseColors.y_red)
            green = BaseColors.y_green + ratio * (BaseColors.g_green - BaseColors.y_green)
            blue = BaseColors.y_blue + ratio * (BaseColors.g_blue - BaseColors.y_blue)
        }
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
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
    
    
}
