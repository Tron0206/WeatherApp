//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Zhasur Sidamatov on 14/07/2022.
//

import Foundation

// MARK: - Welcome
struct CurrentWeather: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let sys: Sys
    let name: String
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Int
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let country: String
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
