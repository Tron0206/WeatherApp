//
//  UIStackView+Extension.swift
//  WeatherApp
//
//  Created by Zhasur Sidamatov on 27/07/22.
//

import Foundation
import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0) {
        self.init()
        arrangedSubviews.forEach { addArrangedSubview($0) }
        self.spacing = spacing
        self.axis = axis
    }
}
