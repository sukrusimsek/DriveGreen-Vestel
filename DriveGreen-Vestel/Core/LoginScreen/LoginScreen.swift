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
    func configureMailTextField()
    func configurePasswordTextField()
    func configureSignInButton()
}

final class LoginScreen: UIViewController {
    private let viewModel = LoginViewModel()
    private let stackView = UIStackView()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let signInButton = UIButton()
    private let signInWithGoogleButton = UIButton()
    private let signInWithAppleButton = ASAuthorizationAppleIDButton()
    private let signUpButton = UIButton()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
    }

}

extension LoginScreen: LoginScreenInterface {
    func configureVC() {
        view.backgroundColor = .green
    }
    func configureStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .center
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: view.frame.size.width - 20),
            stackView.heightAnchor.constraint(equalToConstant: 350),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    func configureMailTextField() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.keyboardType = .emailAddress
        emailTextField.borderStyle = .none
        emailTextField.placeholder = "E-Posta"
        if let myImage = UIImage(systemName: "at") {
            emailTextField.withImage(direction: .Left, image: myImage, colorSeparator: .clear, colorBorder: .clear)
        }
        stackView.addArrangedSubview(emailTextField)
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
    }
    func configurePasswordTextField() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.returnKeyType = .done
        passwordTextField.borderStyle = .none
        passwordTextField.placeholder = "Şifre"
        passwordTextField.isSecureTextEntry = true
        stackView.addArrangedSubview(passwordTextField)
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
    }
    func configureSignInButton() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Giriş Yap", for: .normal)
        signInButton.layer.cornerRadius = 16
        signInButton.backgroundColor = .lightGray
        if emailTextField.text == "" && passwordTextField.text == "" {
            print("Buton Aktif")
            signInButton.setTitleColor(.systemGreen, for: .normal)
        } else {
            signInButton.setTitleColor(.red, for: .normal)
        }
        stackView.addArrangedSubview(signInButton)
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        signInButton.addTarget(self, action: #selector(tappedSignIn), for: .touchUpInside)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @objc func tappedSignIn() {
        print("Giriş Yap Tapped")
    }
}


