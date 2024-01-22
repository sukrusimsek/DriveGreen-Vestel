//
//  ViewController.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 22.01.2024.
//

import UIKit
protocol SettingScreenInterface: AnyObject {
    
}

class SettingScreen: UIViewController {
    private let viewModel = SettingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
        
    }

}
extension SettingScreen: SettingScreenInterface {
    
}
