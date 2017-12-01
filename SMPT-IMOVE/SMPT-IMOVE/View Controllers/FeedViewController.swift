//
//  FeedViewController.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 30/11/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import UIKit

var WeatherDetails = [Weather]()

class FeedViewController: UIViewController {

    @IBOutlet weak var btn_Scale: UIButton!
    @IBOutlet weak var btn_Event: UIButton!
    @IBOutlet weak var btn_Map: UIButton!
    @IBOutlet weak var btn_Training: UIButton!
    
    let colour = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
    
    private let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "d68d6cde2375a71f8308d555ee7a401c"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_Scale.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        btn_Event.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        btn_Map.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        btn_Training.tintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0);
        // Do any additional setup after loading the view.
        
        let weather = WeatherGetter()
        weather.getWeatherInfo(city: "Eindhoven")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
