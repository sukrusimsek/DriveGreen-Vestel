//
//  ProfileScreen.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 31.01.2024.
//

import UIKit
protocol ProfileScreenInterface: AnyObject {
    func configureVC()
}
class ProfileScreen: UIViewController {
    private let viewModel = ProfileViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
    }
}
extension ProfileScreen: ProfileScreenInterface {
    func configureVC() {
        view.backgroundColor = .blue
    }
}
