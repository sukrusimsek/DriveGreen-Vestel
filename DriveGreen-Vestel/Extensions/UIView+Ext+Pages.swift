//
//  UIView+Ext+Pages.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 25.01.2024.
//

import UIKit

extension UIView {
    func showPageIndicator(color: UIColor,width: CGFloat) {
        let viewForPage = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 3))
        viewForPage.backgroundColor = color
        viewForPage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewForPage)
        
        
    }
}
