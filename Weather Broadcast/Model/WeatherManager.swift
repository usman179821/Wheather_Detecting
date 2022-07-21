//
//  WeatherManager.swift
//  Weather Broadcast
//
//  Created by Admin on 27/06/2022.
//

import Foundation
import CoreLocation
import UIKit

//MARK: - protocol Delegate
protocol WeatherManagerDelegate {

}
//
struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=1967fb74bb2564521a208dbdeaad8499"

    func fetchWeather(cityName:String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        perfromRequest(ulrString: urlString)
    }

    func perfromRequest(ulrString:String) {
        //MARK: - create url
        //MARK: - option
        if let url = URL(string: ulrString) {
            //MARK: - create url session

            let session = URLSession(configuration: .default)
            //MARK: - given a session task

       let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
         //MARK: - start task

            task.resume()

        }
    }

    func handle(data:Data?,response: URLResponse?,error:Error?) {
        if error != nil {
            print(error!)
            return
        }
        if let safedata = data {

            let datastring = String(data: safedata,encoding: .utf8)
            print(datastring)

        }
    }
}

