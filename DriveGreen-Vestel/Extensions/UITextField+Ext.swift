//
//  UITextField+Ext.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 22.01.2024.
//

import UIKit
//The ext adding the image for left or right on textfield
extension UITextField {

enum Direction {
    case Left
    case Right
}
    func withImage(direction: Direction, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor, tintColor: UIColor){
    let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 45))
    mainView.layer.cornerRadius = 5

    let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 45))
    view.backgroundColor = .clear
    view.clipsToBounds = true
    mainView.addSubview(view)
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.tintColor = tintColor
    imageView.frame = CGRect(x: 2.0, y: 10.0, width: 24.0, height: 24.0)
    view.addSubview(imageView)

    let seperatorView = UIView()
    seperatorView.backgroundColor = colorSeparator
    mainView.addSubview(seperatorView)

    if(Direction.Left == direction){
        seperatorView.frame = CGRect(x: 5, y: 0, width: 5, height: 45)
        self.leftViewMode = .always
        self.leftView = mainView
    } else {
        seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
        self.rightViewMode = .always
        self.rightView = mainView
    }

    self.layer.borderColor = colorBorder.cgColor
    self.layer.borderWidth = CGFloat(0.5)
    self.layer.cornerRadius = 5
    }
    
}
