//
//  HomeScreen.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 30.01.2024.
//

import UIKit
protocol HomeScreenInterface: AnyObject {
    
}

class HomeScreen: UIViewController {
    private let viewModel = HomeViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel.view = self
        viewModel.viewDidLoad()
        
        
    }
}
extension HomeScreen: HomeScreenInterface {
    
}
