//
//  HomeViewModel.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 30.01.2024.
//

import Foundation
protocol HomeViewModelInterface {
    var view: HomeScreenInterface? { get set }
    func viewDidLoad()
}

final class HomeViewModel {
    weak var view: HomeScreenInterface?
}

extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        
    }
}
