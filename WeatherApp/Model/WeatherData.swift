//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Zhasur Sidamatov on 27/07/22.
//

import Foundation


// MARK: - WeatherData
struct WeatherData: Codable {
    let coord: Coord?
    let weather: [Weather]?
    let main: Main?
    let wind: Wind?
    let name: String?
    let id: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double?
}

// MARK: - Main
struct Main: Codable {
    let temp: Double?
    let pressure, humidity: Int?
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
}
