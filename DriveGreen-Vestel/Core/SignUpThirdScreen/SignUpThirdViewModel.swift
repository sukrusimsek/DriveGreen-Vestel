//
//  SignUpThirdViewModel.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 28.01.2024.
//

import Foundation
protocol SignUpThirdViewModelInterface {
    var view: SignUpThirdScreenInterface? { get set }
    func viewDidLoad()
}

final class SignUpThirdViewModel {
    weak var view: SignUpThirdScreenInterface?
}

extension SignUpThirdViewModel: SignUpThirdViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureShowPages()
        view?.configureLabelAndIcon()
        view?.configureSendAgainMailButton()
    }
}
