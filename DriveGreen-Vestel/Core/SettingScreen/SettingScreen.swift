//
//  SettingScreen.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 31.01.2024.
//

import UIKit

protocol SettingScreenInterface: AnyObject {
    func configureVC()
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
    func configureVC() {
        view.backgroundColor = .red
    }
}
