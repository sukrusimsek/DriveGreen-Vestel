//
//  UIView+Ext+Gradient.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 30.01.2024.
//

import UIKit

extension UIView {
    func applyGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint, locations: [NSNumber]? = [0.0,0.7]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.locations = locations
        if let buttonLayer = self.layer.sublayers?.first(where: { $0 is CAGradientLayer }) {
            buttonLayer.removeFromSuperlayer()
        }
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
