//
//  SettingViewModel.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 22.01.2024.
//

import Foundation
protocol SettingViewModelInterface {
    var view: SettingScreenInterface? { get set }
    func viewDidLoad()
}

final class SettingViewModel {
    weak var view: SettingScreenInterface?
}

extension SettingViewModel: SettingViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePDFView()
        view?.configureShowPages()
        view?.configureAcceptButtons()
        view?.configureGoButton()
    }
}
