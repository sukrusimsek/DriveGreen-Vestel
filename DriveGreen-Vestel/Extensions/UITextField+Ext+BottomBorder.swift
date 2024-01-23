//
//  UITextField+Ext+BottomBorder.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 23.01.2024.
//

import UIKit

extension UITextField {
    internal func addBottomBorder(height: CGFloat = 1.0, color: UIColor = .black) {
        let borderView = UIView()
        borderView.backgroundColor = color
        borderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(borderView)
        NSLayoutConstraint.activate(
            [
                borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
                borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
                borderView.bottomAnchor.constraint(equalTo: bottomAnchor),
                borderView.heightAnchor.constraint(equalToConstant: height)
            ]
        )
    }
}
