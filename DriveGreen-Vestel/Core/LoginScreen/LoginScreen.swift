//
//  ViewController.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 21.01.2024.
//

import UIKit
import AuthenticationServices

protocol LoginScreenInterface: AnyObject {
    func configureVC()
    func configureStackView()
}

final class LoginScreen: UIViewController {
    private let viewModel = LoginViewModel()
    private let stackView = UIStackView()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let signInButton = UIButton()
    private let signUpButton = UIButton()
    private let signInWithGoogleButton = UIButton()
    private let signInWithAppleButton = ASAuthorizationAppleIDButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
    }

}

extension LoginScreen: LoginScreenInterface {
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    func configureStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .center
        stackView.backgroundColor = .blue
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: view.frame.size.width - 20),
            stackView.heightAnchor.constraint(equalToConstant: 350),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
