//
//  UIView+Ext.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 23.01.2024.
//

import UIKit
//Add Shadow

extension UIView {
    func addShadow(color  : UIColor,
                   opacity: Float,
                   offset : CGSize,
                   radius : CGFloat)
    {
        layer.shadowColor   = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset  = offset
        layer.shadowRadius  = radius
    }
}
