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
        view.backgroundColor = UIColor(rgb: 0x444444)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(rgb: 0x282828)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white,
                                          .font: UIFont.systemFont(ofSize: 18, weight: .semibold)]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
}
