//
//  UILabel+Extension.swift
//  WeatherApp
//
//  Created by Zhasur Sidamatov on 27/07/22.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(size: Double) {
        self.init()
        self.font = .systemFont(ofSize: size)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(size: Double, text: String) {
        self.init()
        self.font = .systemFont(ofSize: size)
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
