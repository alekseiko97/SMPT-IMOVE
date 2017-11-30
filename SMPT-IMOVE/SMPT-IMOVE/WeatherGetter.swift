//
//  WeatherGetter.swift
//  SMPT-IMOVE
//
//  Created by Fhict on 30/11/2017.
//  Copyright © 2017 Fhict. All rights reserved.
//

import Foundation

class WeatherGetter
{
    private let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "d68d6cde2375a71f8308d555ee7a401c"
    
    func getWeather(city: String)
    {
        let session = URLSession.shared
        let weatherRequestURL = NSURL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=(city)")!
        
        let dataTask = session.dataTask(with: weatherRequestURL as URL){
            (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if let error = error {
                // Case 1: Error
                // We got some kind of error while trying to get data from the server.
                print("Error:\n\(error)")
            }
            else {
                // Case 2: Success
                // We got a response from the server!
                print("Data:\n\(data!)")
            }
        }
        dataTask.resume()
    }
}
