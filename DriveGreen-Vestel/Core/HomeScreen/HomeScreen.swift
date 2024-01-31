//
//  HomeScreen.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 30.01.2024.
//

import UIKit
protocol HomeScreenInterface: AnyObject {
    func configureVC()
}

class HomeScreen: UIViewController {
    private let viewModel = HomeViewModel()
    private let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
        
    }
}
extension HomeScreen: HomeScreenInterface {
    func configureVC() {
        navigationItem.hidesBackButton = true
        backgroundImage.image = UIImage(named: "drivegreenback")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        let overlayView = UIView(frame: UIScreen.main.bounds)
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        view.insertSubview(overlayView, aboveSubview: backgroundImage)
        
    }
}
