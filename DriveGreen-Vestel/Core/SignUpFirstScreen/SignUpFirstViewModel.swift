//
//  SettingViewModel.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 22.01.2024.
//

import Foundation
protocol SignUpFirstViewModelInterface {
    var view: SignUpFirstScreenInterface? { get set }
    func viewDidLoad()
}

final class SignUpFirstViewModel {
    weak var view: SignUpFirstScreenInterface?
}

extension SignUpFirstViewModel: SignUpFirstViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePDFView()
        view?.configureShowPages()
        view?.configureAcceptButtons()
        view?.configureGoButton()
    }
}
