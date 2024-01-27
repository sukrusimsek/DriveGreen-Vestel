//
//  SignUpSecondScreen.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 27.01.2024.
//

import UIKit
// I'll change the page for Compositional Layout but firstly I created normal.
protocol SignUpSecondScreenInterface: AnyObject {
    func configureVC()
    func configureShowPages()
    func configureLabelForUpper()
    func configureNameTextField()
    func configureSurnameTextField()
    func configureEmailTextField()
    func configureLabelForPass()
    func configurePasswordTextField()
    func configureCountries()
    func configureContinueButton()
    func configureSignInButton()
    func configureQuestionLabelAboutAccount()
}

final class SignUpSecondScreen: UIViewController {
    
    private let viewModel = SignUpSecondViewModel()
    let iconForAt = UIImage(systemName: "at")
    let iconForName = UIImage(systemName: "person.crop.circle")
    let iconPassEye = UIImage(systemName: "eye")
    let iconPassEyeSlash = UIImage(systemName: "eye.slash")
    let iconForLock = UIImage(systemName: "lock")
    let iconForCountry = UIImage(systemName: "globe")
    let data = ["ABD" ,"Almanya", "Andorra","Türkiye","Belçika","Hollanda","İngiltere","Japonya","Singapur","Yunanistan","İsviçre"]
    private let viewForPageShowStackView = UIStackView()
    private let labelForUpper = UILabel()
    private let nameTextField = UITextField()
    private let surnameTextField = UITextField()
    private let emailTextField = UITextField()
    private let labelForAboutPass = UILabel()
    private let passwordTextField = UITextField()
    private let buttonForPass = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
    private let countriesBackTextField = UITextField()
    private let countriesPickerView = UIPickerView()
    private let continueButton = UIButton()
    private let signInButton = UIButton()
    private let questionForSignIn = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    


}
extension SignUpSecondScreen: SignUpSecondScreenInterface, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    func configureVC() {
        let backButton = UIButton(type: .custom)
        backButton.tintColor = UIColor(rgb: 0x8fc031)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.title = "Kayıt Olun"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        view.backgroundColor = UIColor(rgb: 0x444444)
    }
    @objc func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureShowPages() {
        viewForPageShowStackView.translatesAutoresizingMaskIntoConstraints = false
        viewForPageShowStackView.axis = .horizontal
        viewForPageShowStackView.distribution = .fillEqually
        viewForPageShowStackView.alignment = .top
        viewForPageShowStackView.spacing = 2
        view.addSubview(viewForPageShowStackView)
        NSLayoutConstraint.activate([
            viewForPageShowStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewForPageShowStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewForPageShowStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewForPageShowStackView.heightAnchor.constraint(equalToConstant: 3)
        ])
        let view1 = UIView()
        view1.showPageIndicator(color: UIColor(rgb: 0x8fc031), width: (view.frame.size.width/4) - 2)
        let view2 = UIView()
        view2.showPageIndicator(color: UIColor(rgb: 0x8fc031), width: (view.frame.size.width/4) - 2)
        let view3 = UIView()
        view3.showPageIndicator(color: UIColor(rgb: 0xB6BBC4), width: (view.frame.size.width/4) - 2)
        let view4 = UIView()
        view4.showPageIndicator(color: UIColor(rgb: 0xB6BBC4), width: (view.frame.size.width/4) - 2)
        viewForPageShowStackView.addArrangedSubview(view1)
        viewForPageShowStackView.addArrangedSubview(view2)
        viewForPageShowStackView.addArrangedSubview(view3)
        viewForPageShowStackView.addArrangedSubview(view4)
    }
    func configureLabelForUpper() {
        labelForUpper.translatesAutoresizingMaskIntoConstraints = false
        labelForUpper.text = "Kayıt olun ve Drive Green'i keşfetmeye başlayın."
        labelForUpper.font = .systemFont(ofSize: 13, weight: .semibold)
        labelForUpper.textAlignment = .center
        labelForUpper.textColor = .white
        view.addSubview(labelForUpper)
        
        NSLayoutConstraint.activate([
            labelForUpper.topAnchor.constraint(equalTo: viewForPageShowStackView.bottomAnchor, constant: 10),
            labelForUpper.widthAnchor.constraint(equalToConstant: view.frame.size.width - 20),
        ])
    }
    func configureNameTextField() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.delegate = self
        nameTextField.keyboardType = .namePhonePad
        nameTextField.borderStyle = .none
        nameTextField.autocapitalizationType = .none
        let attributedPlaceholderName = NSAttributedString(string: "İsim", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        nameTextField.attributedPlaceholder = attributedPlaceholderName
        nameTextField.addBottomBorder(height: 1, color: .lightText)
        nameTextField.withImage(direction: .Left, image: iconForAt!, colorSeparator: .clear, colorBorder: .clear, tintColor: .lightText)
        view.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            nameTextField.topAnchor.constraint(equalTo: labelForUpper.bottomAnchor, constant: 15),
            nameTextField.widthAnchor.constraint(equalToConstant: (view.frame.size.width / 2)-20),
            nameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    func configureSurnameTextField() {
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        surnameTextField.delegate = self
        surnameTextField.keyboardType = .emailAddress
        surnameTextField.borderStyle = .none
        surnameTextField.autocapitalizationType = .none
        let attributedPlaceholderSurname = NSAttributedString(string: "Soyad", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        surnameTextField.attributedPlaceholder = attributedPlaceholderSurname
        surnameTextField.addBottomBorder(height: 1, color: .lightText)
        view.addSubview(surnameTextField)
        NSLayoutConstraint.activate([
            surnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            surnameTextField.topAnchor.constraint(equalTo: labelForUpper.bottomAnchor, constant: 15),
            surnameTextField.widthAnchor.constraint(equalToConstant: (view.frame.size.width / 2)-20),
            surnameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    func configureEmailTextField() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
        emailTextField.keyboardType = .emailAddress
        emailTextField.borderStyle = .none
        emailTextField.autocapitalizationType = .none
        let attributedPlaceholderEmail = NSAttributedString(string: "E-Posta", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        emailTextField.attributedPlaceholder = attributedPlaceholderEmail
        emailTextField.addBottomBorder(height: 1, color: .lightText)
        emailTextField.withImage(direction: .Left, image: iconForAt ?? .actions, colorSeparator: .clear, colorBorder: .clear, tintColor: .lightText)
        view.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            emailTextField.widthAnchor.constraint(equalToConstant: view.frame.size.width - 20),
            emailTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    func configureLabelForPass() {
        labelForAboutPass.translatesAutoresizingMaskIntoConstraints = false
        labelForAboutPass.numberOfLines = 0
        let firstText = "Şifreniz şunları içermelidir: "
        let firstAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 11, weight: .light),
            .foregroundColor: UIColor.lightText
        ]
        let attributedText = NSMutableAttributedString(string: firstText,attributes: firstAttributes)
        let secondText = "En az 8 karakter, büyük harf, küçük harf, sembol ve rakam."
        let secondAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 11, weight: .light),
            .foregroundColor: UIColor.white
        ]
        let secondAttributedText = NSAttributedString(string: secondText,attributes: secondAttributes)
        attributedText.append(secondAttributedText)
        labelForAboutPass.attributedText = attributedText
        view.addSubview(labelForAboutPass)
        
        NSLayoutConstraint.activate([
            labelForAboutPass.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            labelForAboutPass.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            labelForAboutPass.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor)
        ])
    }
    
    func configurePasswordTextField() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .done
        passwordTextField.borderStyle = .none
        passwordTextField.clearsOnBeginEditing = false
        passwordTextField.addBottomBorder(height: 1,color: .lightText)
        passwordTextField.withImage(direction: .Left, image: iconForLock!, colorSeparator: .clear, colorBorder: .clear, tintColor: .lightText)
        let attributedPlaceholderPassword = NSAttributedString(string: "Şifre", attributes: [NSAttributedString.Key
            .foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = attributedPlaceholderPassword
        
        buttonForPass.translatesAutoresizingMaskIntoConstraints = false
        buttonForPass.addTarget(self, action: #selector(tappedEyeShowPassword), for: .touchUpInside)
        buttonForPass.setImage(iconPassEyeSlash, for: .normal)
        buttonForPass.tintColor = .lightText

        passwordTextField.addSubview(buttonForPass)
        NSLayoutConstraint.activate([
            buttonForPass.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            buttonForPass.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor)
        ])
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            passwordTextField.topAnchor.constraint(equalTo: labelForAboutPass.bottomAnchor, constant: 15),
            passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.size.width - 20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30)

        ])
    }
    @objc func tappedEyeShowPassword() {
        print("show pass")
    }
    
    
    func configureCountries() {
        countriesBackTextField.translatesAutoresizingMaskIntoConstraints = false
        countriesPickerView.translatesAutoresizingMaskIntoConstraints = false
        
        countriesBackTextField.delegate = self
        countriesPickerView.delegate = self
        countriesPickerView.dataSource = self
        
        countriesBackTextField.returnKeyType = .done
        countriesBackTextField.borderStyle = .none
        countriesBackTextField.addBottomBorder(height: 1,color: .lightText)
        countriesBackTextField.withImage(direction: .Left, image: iconForCountry!, colorSeparator: .clear, colorBorder: .clear, tintColor: .lightText)
        let attributedPlaceholderCountry = NSAttributedString(string: "Ülke", attributes: [NSAttributedString.Key
            .foregroundColor: UIColor.white])
        countriesBackTextField.attributedPlaceholder = attributedPlaceholderCountry
        
        
        countriesBackTextField.inputView = countriesPickerView
        view.addSubview(countriesBackTextField)
        NSLayoutConstraint.activate([
            countriesBackTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            countriesBackTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            countriesBackTextField.widthAnchor.constraint(equalToConstant: view.frame.size.width - 20),
            countriesBackTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countriesBackTextField.text = data[row]
        countriesBackTextField.textColor = .white
        countriesBackTextField.resignFirstResponder()
    }
    
    func configureSignInButton() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Giriş yap", for: .normal)
        signInButton.backgroundColor = .clear
        signInButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        signInButton.setTitleColor(UIColor(rgb: 0x8fc031), for: .normal)
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(tappedSignIn), for: .touchUpInside)
        NSLayoutConstraint.activate([
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    func configureQuestionLabelAboutAccount() {
        questionForSignIn.translatesAutoresizingMaskIntoConstraints = false
        questionForSignIn.text = "Hesabın zaten var mı?"
        questionForSignIn.textColor = .white
        questionForSignIn.textAlignment = .center
        questionForSignIn.font = .systemFont(ofSize: 12, weight: .semibold)
        view.addSubview(questionForSignIn)
        NSLayoutConstraint.activate([
            questionForSignIn.bottomAnchor.constraint(equalTo: signInButton.topAnchor,constant: -5),
            questionForSignIn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    func configureContinueButton() {
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("İleri", for: .normal)
        continueButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        continueButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        continueButton.setTitleColor(.lightText, for: .normal)
        continueButton.layer.cornerRadius = 25
        continueButton.isEnabled = false
        continueButton.addTarget(self, action: #selector(tappedContinueButton), for: .touchUpInside)
        view.addSubview(continueButton)
        NSLayoutConstraint.activate([
            continueButton.bottomAnchor.constraint(equalTo: questionForSignIn.topAnchor,constant: -25),
            continueButton.widthAnchor.constraint(equalToConstant: view.frame.size.width - 40),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

    }
    @objc func tappedContinueButton() {
        print("tapped continue")
    }
    @objc func tappedSignIn() {
        print("sign in")
    }
}
