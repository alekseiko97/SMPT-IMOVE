//
//  FeedViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 30/11/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit
import UserNotifications

class FeedViewController: UIViewController, WeatherGetterDelegate
{
    @IBOutlet weak var btn_Scale: UIButton!
    @IBOutlet weak var btn_Event: UIButton!
    @IBOutlet weak var btn_Map: UIButton!
    @IBOutlet weak var btn_Training: UIButton!
    @IBOutlet weak var lbl_Temp: UILabel!
    @IBOutlet weak var lbl_Humidity: UILabel!
    @IBOutlet weak var lbl_windSpeed: UILabel!
    @IBOutlet weak var lbl_ClothingAdvice: UILabel!
    @IBOutlet weak var iv_weatherDisplayer: UIImageView!
    
    var WeatherDetails = [Weather]()
    var weather: WeatherGetter!
    
    var dangerousWind = false
    var bft = 0

    let colour = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);

    override func viewDidLoad()
    {
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
    
    override func viewDidAppear(_ animated: Bool) {
        makeNotification()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didGetWeather(weather: Weather)
    {
        DispatchQueue.main.async() {
            
            self.Wind(weather: weather)
            self.lbl_Temp.text = "\(Int(round(weather.tempCelsius)))°"
            self.lbl_Humidity.text = "\(weather.humidity)%"
            self.lbl_windSpeed.text = String(self.bft) + " bft"
            
            self.clothingAdvice(weather: weather)
            
            //Check if it's dark outside
            let convertSunset = weather.sunset.timeIntervalSince1970
            let convertSunrise = weather.sunrise.timeIntervalSince1970
            let unix = NSDate().timeIntervalSince1970
            if(unix > convertSunset && unix < convertSunrise)
            {
                self.lbl_ClothingAdvice.text = self.lbl_ClothingAdvice.text! + " Make sure you're visible in the dark by wearing clothes with reflectivity and high visibility"
            }
            
            //Set weather icon
            let iconId = weather.weatherIconID
            let imageName = iconId + ".png"
            self.iv_weatherDisplayer.image = UIImage(named:imageName)
        }
    }
    
    func didNotGetWeather(error: NSError)
    {
        DispatchQueue.main.async() {
            self.showSimpleAlert(title: "Can't get the weather",
                                 message: "The weather service isn't responding.")
        }
        print("didNotGetWeather error: \(error)")
    }
    
    func showSimpleAlert(title: String, message: String)
    {
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
    
    func Wind(weather: Weather)
    {
        //Convert windspeed(m/s) to windspeed(bft)
        
        if(weather.windSpeed <= 0.2)
        {
            bft = 0
        }
        else if(weather.windSpeed > 0.2 &&
            weather.windSpeed <= 1.5)
        {
            bft = 1
        }
        else if(weather.windSpeed > 1.5 &&
            weather.windSpeed <= 3.3)
        {
            bft = 2
        }
        else if(weather.windSpeed > 3.4 &&
            weather.windSpeed <= 5.4)
        {
            bft = 3
        }
        else if(weather.windSpeed > 5.4 &&
            weather.windSpeed <= 7.9)
        {
            bft = 4
        }
        else if(weather.windSpeed > 7.9 &&
            weather.windSpeed <= 10.7)
        {
            bft = 5
        }
        else if(weather.windSpeed > 10.7 &&
            weather.windSpeed <= 13.8)
        {
            bft = 6
        }
        else if(weather.windSpeed > 13.8 &&
            weather.windSpeed <= 17.1)
        {
            bft = 7
        }
        else if(weather.windSpeed > 17.1 &&
            weather.windSpeed <= 20.7)
        {
            bft = 8
        }
        else if(weather.windSpeed > 20.7 &&
            weather.windSpeed <= 24.4)
        {
            bft = 9
        }
        else if(weather.windSpeed > 24.4 &&
            weather.windSpeed <= 28.4)
        {
            bft = 10
        }
        else if(weather.windSpeed > 28.4 &&
            weather.windSpeed <= 32.6)
        {
            bft = 11
        }
        else
        {
            bft = 12
        }
        if bft >= 8
        {
            dangerousWind = true
        }
    }
    
    func clothingAdvice(weather: Weather)
    {
        let firstDigitWeatherID = weather.weatherID / 100
        lbl_ClothingAdvice.text = String(firstDigitWeatherID)

        if(firstDigitWeatherID == 2 ||
            firstDigitWeatherID == 3 ||
            firstDigitWeatherID == 5 ||
            firstDigitWeatherID == 7)
        {
            lbl_ClothingAdvice.text = "Wear wind- and Waterproof clothing. Multiple layers are adviced. Make sure your clothes are made of breathable, sweath-wicking fabrics, combined with mesh ventilation. Wearing a cap can help you agains the rain in your eyes."
        }
        if(weather.tempCelsius > 20 && weather.weatherID == 800 ||
            weather.tempCelsius > 20 && weather.weatherID == 801 ||
            weather.tempCelsius > 25 && weather.weatherID == 802 ||
            weather.tempCelsius > 25 && weather.weatherID == 803 ||
            weather.tempCelsius > 25 && weather.weatherID == 804)
        {
            lbl_ClothingAdvice.text = "Wear breathable, sweath-wicking fabrics, combined with mesh ventilation. Wool layers are also adviced. Don't forget to adept to the sun by wearing a cap, glasses and sun cream. Most importantly: bring a lot of water."
        }
        if(weather.tempCelsius < 5 ||
            firstDigitWeatherID == 6)
        {
            lbl_ClothingAdvice.text = "Make sure to wear multiple layers to protect yourself against the cold. The layers should consist of: A lightweight, tight-fitting base layer or compression top; A running jacket; running tights or compression tights; Running shorts; Gloves and a cap."
        }
      
        if (firstDigitWeatherID == 2 ||
            firstDigitWeatherID == 9 ||
            self.dangerousWind == true)
        {
            self.showSimpleAlert(title: "Warning, bad weather approaching.", message: "Going outside is strongly discouraged.")
        }
    }
    
    func makeNotification()
    {
        let content = UNMutableNotificationContent()
        content.body = Quotes[randomNumber].quote
        content.title = "Make sure to do your exercises today!"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in })
    }
}
