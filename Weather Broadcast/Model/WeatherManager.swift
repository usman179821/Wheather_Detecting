//
//  WeatherManager.swift
//  Weather Broadcast
//
//  Created by Admin on 27/06/2022.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    //func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=1967fb74bb2564521a208dbdeaad8499&q=london"
    
    func fetchWeather(cityName:String) {
        let urlstring = "\(weatherURL)&q=\(cityName)"
        print(urlstring)
    }
}
