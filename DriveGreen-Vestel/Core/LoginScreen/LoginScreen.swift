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
//    func configureQuestionLabelAboutAccount()
//    func configureSignUpButton()
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
    private let iconForAt = UIImage(systemName: "at")
    private let iconForLock = UIImage(systemName: "lock")
    private let iconPassEye = UIImage(systemName: "eye")
    private let iconPassEyeSlash = UIImage(systemName: "eye.slash")
    private let buttonForPass = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
    }

}

extension LoginScreen: LoginScreenInterface, UITextFieldDelegate {
    func configureVC() {
        view.backgroundColor = UIColor(rgb: 0xE8D8C4)
        signInButton.isEnabled = false
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
//            emailTextField.addBottomBorder(color: .placeholderText)
//            passwordTextField.addBottomBorder(color: .placeholderText)
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
        //First control for isEmpty??
        if emailTextField.text == "" || passwordTextField.text == "" {
            signInButton.isEnabled = false
            signInButton.setTitleColor(.placeholderText, for: .normal)
            signInButton.backgroundColor = .lightGray
            
            if emailTextField.text.isEmailValid() {
                //change colors to green for email
                emailTextField.textColor = .white
                emailTextField.addBottomBorder(height: 1,color: .white)
                emailTextField.withImage(direction: .Left, image: iconForAt ?? .actions, colorSeparator: .clear, colorBorder: .clear, tintColor: .white)
                
            } else if !emailTextField.text.isEmailValid() {
                //change colors to red for email
                signInButton.isEnabled = false
                emailTextField.textColor = .systemRed
                if emailTextField.text == "" {
                    emailTextField.addBottomBorder(height: 1,color: .white)
                    emailTextField.withImage(direction: .Left, image: iconForAt ?? .actions, colorSeparator: .clear, colorBorder: .clear, tintColor: .white)
                } else {
                    emailTextField.addBottomBorder(height: 1,color: .systemRed)
                }
                emailTextField.withImage(direction: .Left, image: iconForAt ?? .actions, colorSeparator: .clear, colorBorder: .clear, tintColor: .systemRed)
            }
            
        } else if !passwordTextField.text.isPasswordValid(passwordTextField.text!) { //change to wrong pass
            signInButton.isEnabled = false
            signInButton.setTitleColor(.placeholderText, for: .normal)
            signInButton.backgroundColor = .lightGray
            passwordTextField.textColor = .systemRed
            passwordTextField.addBottomBorder(height: 1,color: .systemRed)
            passwordTextField.withImage(direction: .Left, image: iconForLock ?? .actions, colorSeparator: .clear, colorBorder: .clear, tintColor: .systemRed)
            

        } else if passwordTextField.text.isPasswordValid(passwordTextField.text!) { //change to true pass
            passwordTextField.textColor = .white
            passwordTextField.addBottomBorder(height: 1,color: .white)
            passwordTextField.withImage(direction: .Left, image: iconForLock ?? .actions, colorSeparator: .clear, colorBorder: .clear, tintColor: .white)
            signInButton.isEnabled = true
            signInButton.backgroundColor = UIColor(rgb: 0x9ADE7B)
            signInButton.setTitleColor(.white, for: .normal)
        }

    }
    func textFieldDidEndEditing(_ textField: UITextField) { //Change bottom color when you don't have any char in text field.
        if emailTextField.text == "" {
            emailTextField.addBottomBorder(color: .placeholderText)
        }
        if passwordTextField.text == "" {
            passwordTextField.addBottomBorder(color: .placeholderText)
        }
    }
    func configureMailTextField() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
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
        passwordTextField.clearsOnBeginEditing = false
        passwordTextField.addBottomBorder(color: .placeholderText)
        passwordTextField.withImage(direction: .Left, image: iconForLock!, colorSeparator: .clear, colorBorder: .clear, tintColor: .placeholderText)
        
        buttonForPass.translatesAutoresizingMaskIntoConstraints = false
        buttonForPass.addTarget(self, action: #selector(tappedEyeShowPassword), for: .touchUpInside)
        buttonForPass.setImage(iconPassEyeSlash, for: .normal)
        buttonForPass.tintColor = .white

        passwordTextField.addSubview(buttonForPass)
        NSLayoutConstraint.activate([
            buttonForPass.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            buttonForPass.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor)
        ])
        
        passwordTextField.isSecureTextEntry = true
        stackViewForMailPass.addArrangedSubview(passwordTextField)
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: stackViewForMailPass.widthAnchor).isActive = true

    }
    @objc func tappedEyeShowPassword() {
        print("Tapped ShowPass")//Change the show and hide password button type.
        passwordTextField.isSecureTextEntry.toggle()
        let buttonImage = passwordTextField.isSecureTextEntry ? iconPassEyeSlash : iconPassEye
        buttonForPass.setImage(buttonImage, for: .normal)

    }
    func textFieldDidBeginEditing(_ textField: UITextField) { //Click the textFields and its change the borderColor
        if textField == emailTextField {
            emailTextField.addBottomBorder(height: 1,color: .white)
        } else if textField == passwordTextField {
            passwordTextField.addBottomBorder(height: 1,color: .white)
        }
        
    }
    func configureForgotPasswordButton() {
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitle("Şifremi unuttum", for: .normal)
        forgotPasswordButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
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
        signInButton.setTitleColor(.placeholderText, for: .normal)
        signInButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        signInButton.layer.cornerRadius = 25
        signInButton.backgroundColor = .lightGray
        signInButton.addShadow(color: .black, opacity: 0.5, offset: CGSize(width: 0, height: 1), radius: 2)
        
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


