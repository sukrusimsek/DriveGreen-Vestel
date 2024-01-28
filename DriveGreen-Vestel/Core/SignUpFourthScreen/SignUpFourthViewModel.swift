//
//  SignUpFourthViewModel.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 29.01.2024.
//

import Foundation
protocol SignUpFourthViewModelInterface {
    var view: SignUpFourthScreenInterface? { get set }
    func viewDidLoad()
}

final class SignUpFourthViewModel {
    weak var view: SignUpFourthScreenInterface?
}

extension SignUpFourthViewModel: SignUpFourthViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureShowPages()
        view?.configureLabelAndIcon()
        view?.configureStartUseAppButton()
    }
}
