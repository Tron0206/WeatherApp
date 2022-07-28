//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Zhasur Sidamatov on 26/07/22.
//

import Foundation

protocol MainViewModelProtocol {
    func numberOfCities() -> Int
    func fetchWeatherData(completion: @escaping () -> Void)
    func viewModelForCell(for indexPath: IndexPath) -> MainCellViewModelProtocol
    func viewModelForDetailVC(for indexPath: IndexPath) -> DetailViewModelProtocol
}

class MainViewModel: MainViewModelProtocol {
    var citiesArray = [WeatherData]()
    private let nameCitiesArray = ["Москва", "Обнинск", "Калуга", "Санкт-Петербург", "Уфа", "Сочи", "Волгоград", "Тюмень", "Владивосток", "Казань"]
    let networkManager = NetworkManager()
    
    func numberOfCities() -> Int {
        return citiesArray.count
    }
    
    func viewModelForCell(for indexPath: IndexPath) -> MainCellViewModelProtocol {
        return MainCellViewModel(weatherData: citiesArray[indexPath.row])
    }
    
    func fetchWeatherData(completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        
        for nameCity in nameCitiesArray {
            dispatchGroup.enter()
            LocationManager.getCoordinate(nameCity: nameCity) { coordinate in
                guard let coordinate = coordinate else { return }
                self.networkManager.fetchWeather(latitude: coordinate.latitude,
                                                 longitude: coordinate.longitude) { weather in
                    self.citiesArray.append(weather)
                    dispatchGroup.leave()
                    
                }
            }
        }
        
        dispatchGroup.notify(queue: .global()) {
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func viewModelForDetailVC(for indexPath: IndexPath) -> DetailViewModelProtocol {
        return DetailViewModel(weatherData: citiesArray[indexPath.row])
    }
}
