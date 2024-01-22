//
//  LoginViewModek.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 22.01.2024.
//

import Foundation

protocol LoginViewModelInterface {
    var view: LoginScreenInterface? { get set }
    func viewDidLoad()
}


final class LoginViewModel {
    weak var view: LoginScreenInterface?
    
}

extension LoginViewModel: LoginViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureStackView()
    }
}
