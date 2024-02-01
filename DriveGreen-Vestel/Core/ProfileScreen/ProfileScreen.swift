//
//  ProfileScreen.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 31.01.2024.
//

import UIKit
protocol ProfileScreenInterface: AnyObject {
    func configureVC()
    func configureShadows()
}
class ProfileScreen: UIViewController {
    private let viewModel = ProfileViewModel()
    private let viewForShadow = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
    }
}
extension ProfileScreen: ProfileScreenInterface {
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
    func configureShadows() {
        viewForShadow.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
