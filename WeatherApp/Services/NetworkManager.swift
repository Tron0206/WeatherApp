//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Zhasur Sidamatov on 27/07/22.
//

import Foundation


class NetworkManager {
    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping (WeatherData) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=c6f2d28655554b6b4b5761480579c615&lang=ru"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: 20)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            let weatherData = self.parseJSON(withData: data)
            guard let weatherData = weatherData else { return }
            completion(weatherData)

        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> WeatherData? {
        let decoder = JSONDecoder()
        
        do {
            let weather = try decoder.decode(WeatherData.self, from: data)
            return weather
        } catch let error {
            print(String(describing: error))
            return nil
        }
    }
}
