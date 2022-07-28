//
//  MainCell.swift
//  WeatherApp
//
//  Created by Zhasur Sidamatov on 26/07/22.
//

import UIKit

class MainCell: UITableViewCell {
    
    static let identifier = "MainCell"
    
    var viewModel: MainCellViewModelProtocol! {
        didSet {
            placeLabel.text = viewModel.cityName
            statusLabel.text = viewModel.statusDescription
            temperaturelabel.text = viewModel.temperature
        }
    }
    
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var temperaturelabel: UILabel!
}
