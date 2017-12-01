//
//  FeedViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 30/11/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

var WeatherDetails = [Weather]()

class FeedViewController: UIViewController, WeatherGetterDelegate {

    @IBOutlet weak var btn_Scale: UIButton!
    @IBOutlet weak var btn_Event: UIButton!
    @IBOutlet weak var btn_Map: UIButton!
    @IBOutlet weak var btn_Training: UIButton!
    @IBOutlet weak var lbl_Temp: UILabel!
    @IBOutlet weak var lbl_Humidity: UILabel!
    @IBOutlet weak var lbl_windSpeed: UILabel!
    @IBOutlet weak var lbl_ClothingAdvice: UILabel!
    
    var weather: WeatherGetter!
    
    let colour = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_Scale.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        btn_Event.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        btn_Map.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        btn_Training.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        // Do any additional setup after loading the view.
        
        lbl_Temp.text = ""
        lbl_Humidity.text = ""
        lbl_windSpeed.text = ""
        lbl_ClothingAdvice.text = ""
        
        weather = WeatherGetter(delegate: self)
        weather.getWeatherInfo(city: "Eindhoven")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didGetWeather(weather: Weather) {
        DispatchQueue.main.async() {
            self.lbl_Temp.text = "\(Int(round(weather.tempCelsius)))°"
            self.lbl_Humidity.text = "\(weather.humidity)%"
            self.lbl_windSpeed.text = "\(weather.windSpeed) m/s"
            self.lbl_ClothingAdvice.text = "YEAAHHBOOIII"
        }
    }
    
    func didNotGetWeather(error: NSError) {
        DispatchQueue.main.async() {
            self.showSimpleAlert(title: "Can't get the weather",
                                 message: "The weather service isn't responding.")
            //print("ERROR, Weather service is not responding.")
        }
        print("didNotGetWeather error: \(error)")
    }
    
    func showSimpleAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "OK",
            style:  .default,
            handler: nil
        )
        alert.addAction(okAction)
        present(
            alert,
            animated: true,
            completion: nil
        )
    }
}
