//
//  SignUpSecondScreen.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 27.01.2024.
//

import Foundation
protocol SignUpSecondViewModelInterface {
    var view: SignUpSecondScreenInterface? { get set }
    func viewDidLoad()
}

final class SignUpSecondViewModel {
    weak var view: SignUpSecondScreenInterface?
}

extension SignUpSecondViewModel: SignUpSecondViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureShowPages()
        view?.configureLabelForUpper()
        view?.configureNameTextField()
        view?.configureSurnameTextField()
        view?.configureEmailTextField()
        view?.configureLabelForPass()
        view?.configurePasswordTextField()
        view?.configureCountries()
        view?.configureSignInButton()
        view?.configureQuestionLabelAboutAccount()
        view?.configureContinueButton()


    }
}
