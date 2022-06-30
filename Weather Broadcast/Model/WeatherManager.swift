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
        let urlString = "\(weatherURL)&q=\(cityName)"
        self.perfromRequest(urlString: urlString)
    }
     
    func perfromRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(Data,Response, Error) in
                if Error != nil {
                    print(Error!)
                    return
                }
                if let  safeData = Data {
                    self.parseJSON(weatherData: safeData)
         }
        }
            task.resume()
            
      }
    }
        func parseJSON(weatherData: Data) {
            let decoderx = JSONDecoder()
            do {
//                let decodedData = try decoderx.decode(weatherData.self, from: weatherData)
//                print(decodedData.name)
                
            } catch {
                print(Error.self)
            }
            
        }
}

