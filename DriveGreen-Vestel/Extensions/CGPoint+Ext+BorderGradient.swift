//
//  CGPoint+Ext+BorderGradient.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 1.02.2024.
//

import UIKit

extension CGPoint {
    static let topLeft = CGPoint(x: 0, y: 0)
    static let topCenter = CGPoint(x: 0.5, y: 0)
    static let topRight = CGPoint(x: 1, y: 0)
    static let centerLeft = CGPoint(x: 0, y: 0.5)
    static let center = CGPoint(x: 0.5, y: 0.5)
    static let centerRight = CGPoint(x: 1, y: 0.5)
    static let bottomLeft = CGPoint(x: 0, y: 1.0)
    static let bottomCenter = CGPoint(x: 0.5, y: 1.0)
    static let bottomRight = CGPoint(x: 1, y: 1)
}
func addBorderGradient(to view: UIView, startColor:UIColor, endColor: UIColor, lineWidth: CGFloat, startPoint: CGPoint, endPoint: CGPoint) {
    view.layer.cornerRadius = view.bounds.size.height / 2.0
    view.clipsToBounds = true
    let gradient = CAGradientLayer()
    gradient.frame = view.bounds
    gradient.colors = [startColor.cgColor, endColor.cgColor]
    gradient.startPoint = startPoint
    gradient.endPoint = endPoint
    let shape = CAShapeLayer()
    shape.lineWidth = lineWidth
    shape.path = UIBezierPath(
        arcCenter: CGPoint(x: view.bounds.height/2,
                           y: view.bounds.height/2),
        radius: view.bounds.height/2,
        startAngle: CGFloat(0),
        endAngle:CGFloat(CGFloat.pi * 2),
        clockwise: true).cgPath
    shape.strokeColor = UIColor.black.cgColor
    shape.fillColor = UIColor.clear.cgColor
    gradient.mask = shape
    view.layer.addSublayer(gradient)
}
