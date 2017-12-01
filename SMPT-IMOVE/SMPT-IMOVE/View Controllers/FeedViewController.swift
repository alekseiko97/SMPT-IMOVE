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
    @IBOutlet weak var iv_weatherDisplayer: UIImageView!
    
    var weather: WeatherGetter!
    
    let colour = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_Scale.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        btn_Event.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        btn_Map.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        btn_Training.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        
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
            
            var bft : Int
            if(weather.windSpeed <= 0.2)
            {
                bft = 0
            }
            else if(weather.windSpeed > 0.2 && weather.windSpeed <= 1.5)
            {
                bft = 1
            }
            else if(weather.windSpeed > 1.5 && weather.windSpeed <= 3.3)
            {
                bft = 2
            }
            else if(weather.windSpeed > 3.4 && weather.windSpeed <= 5.4)
            {
                bft = 3
            }
            else if(weather.windSpeed > 5.4 && weather.windSpeed <= 7.9)
            {
                bft = 4
            }
            else if(weather.windSpeed > 7.9 && weather.windSpeed <= 10.7)
            {
                bft = 5
            }
            else if(weather.windSpeed > 10.7 && weather.windSpeed <= 13.8)
            {
                bft = 6
            }
            else if(weather.windSpeed > 13.8 && weather.windSpeed <= 17.1)
            {
                bft = 7
            }
            else if(weather.windSpeed > 17.1 && weather.windSpeed <= 20.7)
            {
                bft = 8
            }
            else if(weather.windSpeed > 20.7 && weather.windSpeed <= 24.4)
            {
                bft = 9
            }
            else if(weather.windSpeed > 24.4 && weather.windSpeed <= 28.4)
            {
                bft = 10
            }
            else if(weather.windSpeed > 28.4 && weather.windSpeed <= 32.6)
            {
                bft = 11
            }
            else
            {
                bft = 12
            }
            self.lbl_Temp.text = "\(Int(round(weather.tempCelsius)))°"
            self.lbl_Humidity.text = "\(weather.humidity)%"
            self.lbl_windSpeed.text = String(bft) + " bft"
            self.lbl_ClothingAdvice.text = "YEAAHHBOOIII"
            let iconId = weather.weatherIconID
            let imageName = iconId + ".png"
            self.iv_weatherDisplayer.image = UIImage(named:imageName)
            
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
