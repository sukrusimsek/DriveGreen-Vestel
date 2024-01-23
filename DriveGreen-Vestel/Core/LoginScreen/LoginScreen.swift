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
    func configureStackViewForButtons()
    func configureStackViewForMailPass()
    func configureMailTextField()
    func configurePasswordTextField()
    func configureForgotPasswordButton()
    func configureSignInButton()
    func configureOrLabel()
    func configureGoogleButton()
    func configureAppleButton()
}

final class LoginScreen: UIViewController {
    private let viewModel = LoginViewModel()
    private let stackViewForMailPass = UIStackView()
    private let stackViewForButtons = UIStackView()
    
    
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let forgotPasswordButton = UIButton()
    private let signInButton = UIButton()
    private let orLabel = UILabel()
    private let signInWithGoogleButton = UIButton()
    private let signInWithAppleButton = ASAuthorizationAppleIDButton(type: .default, style: .white)
    private let signUpButton = UIButton()
    let iconForAt = UIImage(systemName: "at")
    let iconForLock = UIImage(systemName: "lock")

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
    }

}

extension LoginScreen: LoginScreenInterface, UITextFieldDelegate {
    func configureVC() {
        view.backgroundColor = .label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap() {
        view.endEditing(true)
        if emailTextField.text == "" && passwordTextField.text == "" {
            emailTextField.textColor = .placeholderText
            emailTextField.withImage(direction: .Left, image: iconForAt ?? .actions, colorSeparator: .clear, colorBorder: .clear, tintColor: .placeholderText)
            passwordTextField.textColor = .placeholderText
            passwordTextField.withImage(direction: .Left, image: iconForLock ?? .actions, colorSeparator: .clear, colorBorder: .clear, tintColor: .placeholderText)
            emailTextField.addBottomBorder(height: 1,color: .placeholderText)
            passwordTextField.addBottomBorder(height: 1,color: .placeholderText)
        } else {
            //print("pass or mail not free")
        }
    }
    func configureStackViewForButtons() {
        stackViewForButtons.translatesAutoresizingMaskIntoConstraints = false
        stackViewForButtons.axis = .vertical
        stackViewForButtons.spacing = 10
        stackViewForButtons.alignment = .center
        view.addSubview(stackViewForButtons)
        NSLayoutConstraint.activate([
            stackViewForButtons.widthAnchor.constraint(equalToConstant: view.frame.size.width - 20),
            stackViewForButtons.heightAnchor.constraint(equalToConstant: 230),
            stackViewForButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewForButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    func configureStackViewForMailPass() {
        stackViewForMailPass.translatesAutoresizingMaskIntoConstraints = false
        stackViewForMailPass.axis = .vertical
        stackViewForMailPass.alignment = .leading
        stackViewForMailPass.distribution = .equalSpacing
        stackViewForMailPass.spacing = 10
        view.addSubview(stackViewForMailPass)
        
        NSLayoutConstraint.activate([
            stackViewForMailPass.bottomAnchor.constraint(equalTo: stackViewForButtons.topAnchor, constant: -10),
            stackViewForMailPass.heightAnchor.constraint(equalToConstant: 110),
            stackViewForMailPass.widthAnchor.constraint(equalToConstant: view.frame.size.width - 20),
            stackViewForMailPass.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if emailTextField.text == "" || passwordTextField.text == "" {
            signInButton.isEnabled = false
            signInButton.setTitleColor(.placeholderText, for: .normal)
            if emailTextField.text.isEmailValid() {
                //change colors to green
                emailTextField.textColor = .white
                emailTextField.addBottomBorder(height: 1,color: .white)
                emailTextField.withImage(direction: .Left, image: iconForAt ?? .actions, colorSeparator: .clear, colorBorder: .clear, tintColor: .systemGreen)
                
                
            } else {
                //change colors to red
                emailTextField.textColor = .systemRed
                emailTextField.addBottomBorder(height: 1,color: .systemRed)
                emailTextField.withImage(direction: .Left, image: iconForAt ?? .actions, colorSeparator: .clear, colorBorder: .clear, tintColor: .systemRed)
            }
        } else {
            signInButton.setTitleColor(.white, for: .normal)
            signInButton.isEnabled = true
        }
    }

    func configureMailTextField() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
        signInButton.setTitleColor(.placeholderText, for: .normal)
        emailTextField.keyboardType = .emailAddress
        emailTextField.borderStyle = .none
        emailTextField.autocapitalizationType = .none
        emailTextField.placeholder = "E-Posta"

       
        emailTextField.addBottomBorder(height: 1, color: .placeholderText)
        emailTextField.withImage(direction: .Left, image: iconForAt ?? .actions, colorSeparator: .clear, colorBorder: .clear, tintColor: .placeholderText)
        
        stackViewForMailPass.addArrangedSubview(emailTextField)
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: stackViewForMailPass.widthAnchor).isActive = true
        
    }
    
    func configurePasswordTextField() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .done
        passwordTextField.borderStyle = .none
        passwordTextField.placeholder = "Şifre"
        passwordTextField.addBottomBorder(height: 1,color: .placeholderText)
        if let myImage = UIImage(systemName: "lock") {
            passwordTextField.withImage(direction: .Left, image: myImage, colorSeparator: .clear, colorBorder: .clear, tintColor: .placeholderText)
        }
        
        passwordTextField.isSecureTextEntry = true
        stackViewForMailPass.addArrangedSubview(passwordTextField)
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: stackViewForMailPass.widthAnchor).isActive = true

    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextField.addBottomBorder(height: 1,color: .white)
        } else if textField == passwordTextField {
            passwordTextField.addBottomBorder(height: 1,color: .white)
        }
        
    }
    func configureForgotPasswordButton() {
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitle("Şifremi unuttum", for: .normal)
        forgotPasswordButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        forgotPasswordButton.backgroundColor = .clear
        
        forgotPasswordButton.setTitleColor(.white, for: .normal)
        stackViewForMailPass.addArrangedSubview(forgotPasswordButton)
        
        forgotPasswordButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        forgotPasswordButton.widthAnchor.constraint(equalToConstant: view.frame.size.width/3).isActive = true
        forgotPasswordButton.addTarget(self, action: #selector(tappedForgotPassButton), for: .touchUpInside)
    }
    func configureSignInButton() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Giriş Yap", for: .normal)
        signInButton.layer.cornerRadius = 25
        signInButton.backgroundColor = .lightGray

        
        stackViewForButtons.addArrangedSubview(signInButton)
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInButton.widthAnchor.constraint(equalTo: stackViewForButtons.widthAnchor).isActive = true
        signInButton.addTarget(self, action: #selector(tappedSignIn), for: .touchUpInside)
        
    }
    func configureOrLabel() {
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.text = "veya"
        orLabel.textColor = .white
        orLabel.textAlignment = .center
        orLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        stackViewForButtons.addArrangedSubview(orLabel)
        orLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        orLabel.widthAnchor.constraint(equalTo: stackViewForButtons.widthAnchor).isActive = true
    }
    func configureGoogleButton() {
        signInWithGoogleButton.translatesAutoresizingMaskIntoConstraints = false
        signInWithGoogleButton.setTitle("Google ile giriş yapın", for: .normal)
        signInWithGoogleButton.backgroundColor = UIColor(rgb: 0xDB4437)
        signInWithGoogleButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        signInWithGoogleButton.titleLabel?.textColor = UIColor.white
        signInWithGoogleButton.layer.cornerRadius = 25
        stackViewForButtons.addArrangedSubview(signInWithGoogleButton)
        signInWithGoogleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInWithGoogleButton.widthAnchor.constraint(equalTo: stackViewForButtons.widthAnchor).isActive = true
        signInWithGoogleButton.addTarget(self, action: #selector(tappedSignInWithGoogle), for: .touchUpInside)
        
    }
    
    func configureAppleButton() {
        signInWithAppleButton.translatesAutoresizingMaskIntoConstraints = false
        signInWithAppleButton.cornerRadius = 25
        
        stackViewForButtons.addArrangedSubview(signInWithAppleButton)
        signInWithAppleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInWithAppleButton.widthAnchor.constraint(equalTo: stackViewForButtons.widthAnchor).isActive = true
        signInWithAppleButton.addTarget(self, action: #selector(tappedSignInWithApple), for: .touchUpInside)

    }
    
    
    
    
    
    
    
    
    
    
    
    
    @objc func tappedSignIn() {
        print("Giriş Yap Tapped")
    }
    @objc func tappedSignInWithGoogle() {
        print("Google ile giriş yap tapped")
    }
    @objc func tappedSignInWithApple() {
        print("Apple ile Giriş Yap tapped")
    }
    @objc func tappedForgotPassButton() {
        print("Forgot button tapped")
    }
}


