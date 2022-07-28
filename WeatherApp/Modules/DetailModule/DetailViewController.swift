//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Zhasur Sidamatov on 27/07/22.
//

import Foundation
import UIKit


class DetailViewController: UIViewController {
    private let cityNameLabel: UILabel = {
        let label = UILabel(size: 40)
        label.text = "Название города"
        label.textAlignment = .center
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .systemBlue
        iv.layer.cornerRadius = 10
        return iv
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel(size: 25)
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel(size: 20)
        return label
    }()
    
    private let pressureLabel: UILabel = {
        let label = UILabel(size: 17)
        return label
    }()
    
    private let windVelocityLabel: UILabel = {
        let label = UILabel(size: 17)
        return label
    }()
    
    private let humidityLabel: UILabel = {
        let label = UILabel(size: 17)
        return label
    }()
    
    
    
    var viewModel: DetailViewModelProtocol! {
        didSet {
            cityNameLabel.text = viewModel.cityName
            if let icon = viewModel.icon {
                print(icon)
                iconImageView.image = UIImage(named: icon)
            }
            statusLabel.text = viewModel.status
            temperatureLabel.text = viewModel.temperature
            pressureLabel.text = viewModel.pressure
            windVelocityLabel.text = viewModel.windVelocity
            humidityLabel.text = viewModel.humidity
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
}

extension DetailViewController {
    private func setupView() {
        let nameRowStackView = UIStackView(arrangedSubviews: [UILabel(size: 19, text: "Давление:"),
                                                             UILabel(size: 19, text: "Скорость ветра:"),
                                                             UILabel(size: 19, text: "Влажность:")],
                                           axis: .vertical,
                                           spacing: 10)
        let pressureStackView = UIStackView(arrangedSubviews: [pressureLabel,
                                                              UILabel(size: 17, text: "мм.рт.ст")],
                                            axis: .horizontal,
                                            spacing: 2)
        let velocityStackView = UIStackView(arrangedSubviews: [windVelocityLabel,
                                                              UILabel(size: 17, text: "м/с")],
                                            axis: .horizontal,
                                            spacing: 2)
        let humidityStackView = UIStackView(arrangedSubviews: [humidityLabel,
                                                              UILabel(size: 17, text: "%")],
                                            axis: .horizontal,
                                            spacing: 2)
        let infoStackView = UIStackView(arrangedSubviews: [pressureStackView,
                                                          velocityStackView,
                                                          humidityStackView],
                                        axis: .vertical,
                                        spacing: 10)
        
        let mainStackView = UIStackView(arrangedSubviews: [nameRowStackView,
                                                          infoStackView],
                                        axis: .horizontal)
        let temperatureStackView = UIStackView(arrangedSubviews: [temperatureLabel,
                                                                  UILabel(size: 20, text: "℃")],
                                               axis: .horizontal)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        temperatureStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainStackView)
        view.addSubview(cityNameLabel)
        view.addSubview(iconImageView)
        view.addSubview(statusLabel)
        view.addSubview(temperatureStackView)
        
        
        NSLayoutConstraint.activate([cityNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     cityNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     cityNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     cityNameLabel.bottomAnchor.constraint(equalTo: iconImageView.topAnchor, constant: -40),
                                     cityNameLabel.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     iconImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     iconImageView.heightAnchor.constraint(equalToConstant: 100),
                                     iconImageView.widthAnchor.constraint(equalToConstant: 100)])
        
        NSLayoutConstraint.activate([statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     statusLabel.heightAnchor.constraint(equalToConstant: 30),
                                     statusLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 35),
                                     statusLabel.bottomAnchor.constraint(equalTo: temperatureStackView.topAnchor, constant: -20)])
        
        NSLayoutConstraint.activate([temperatureStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     temperatureStackView.heightAnchor.constraint(equalToConstant: 24),
                                     temperatureStackView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
                                     temperatureStackView.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -50)])
        
        NSLayoutConstraint.activate([mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     mainStackView.topAnchor.constraint(equalTo: temperatureStackView.bottomAnchor, constant: 50)])
        

        
    }
}
