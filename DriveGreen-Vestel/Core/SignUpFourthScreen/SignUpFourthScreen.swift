//
//  SignUpFourthScreen.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 29.01.2024.
//

import UIKit
protocol SignUpFourthScreenInterface: AnyObject {
    func configureVC()
    func configureShowPages()
    func configureLabelAndIcon()
    func configureStartUseAppButton()
}

final class SignUpFourthScreen: UIViewController {
    private let viewModel = SignUpFourthViewModel()
    private let viewForPageShowStackView = UIStackView()
    private let iconView = UIImageView()
    private let labelAboutCreatedAccount = UILabel()
    private let labelAboutSendedMailInfo = UILabel()
    private let buttonForGoToHomePage = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}
extension SignUpFourthScreen: SignUpFourthScreenInterface {
    func configureVC() {
        
        navigationItem.title = "Aktivasyon"
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        view.backgroundColor = UIColor(rgb: 0x444444)
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
        view3.showPageIndicator(color: UIColor(rgb: 0x8fc031), width: (view.frame.size.width/4) - 2)
        let view4 = UIView()
        view4.showPageIndicator(color: UIColor(rgb: 0x8fc031), width: (view.frame.size.width/4) - 2)
        viewForPageShowStackView.addArrangedSubview(view1)
        viewForPageShowStackView.addArrangedSubview(view2)
        viewForPageShowStackView.addArrangedSubview(view3)
        viewForPageShowStackView.addArrangedSubview(view4)
    }
    func configureLabelAndIcon() {
        iconView.translatesAutoresizingMaskIntoConstraints = false
        labelAboutCreatedAccount.translatesAutoresizingMaskIntoConstraints = false
        labelAboutSendedMailInfo.translatesAutoresizingMaskIntoConstraints = false
        
        iconView.image = UIImage(systemName: "checkmark.circle.fill")
        iconView.tintColor = UIColor(rgb: 0x8fc031)
        view.addSubview(iconView)
        labelAboutCreatedAccount.text = "Hesabınız yaratıldı!"
        labelAboutCreatedAccount.font = .systemFont(ofSize: 14, weight: .bold)
        labelAboutCreatedAccount.textColor = .white
        labelAboutCreatedAccount.textAlignment = .center
        view.addSubview(labelAboutCreatedAccount)
        labelAboutSendedMailInfo.text = "Hesap bilgileriniz e-posta adresinize gönderilmiştir."
        labelAboutSendedMailInfo.font = .systemFont(ofSize: 14, weight: .semibold)
        labelAboutSendedMailInfo.textColor = .white
        labelAboutSendedMailInfo.textAlignment = .center
        view.addSubview(labelAboutSendedMailInfo)
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -30),
            iconView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 90),
            iconView.heightAnchor.constraint(equalToConstant: 90),
            
            labelAboutCreatedAccount.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10),
            labelAboutCreatedAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelAboutCreatedAccount.widthAnchor.constraint(equalToConstant: view.frame.width - 20),
            labelAboutSendedMailInfo.topAnchor.constraint(equalTo: labelAboutCreatedAccount.bottomAnchor, constant: 5),
            labelAboutSendedMailInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelAboutSendedMailInfo.widthAnchor.constraint(equalToConstant: view.frame.width - 20),
            
        ])
    }
    func configureStartUseAppButton() {
        buttonForGoToHomePage.translatesAutoresizingMaskIntoConstraints = false

        
        buttonForGoToHomePage.setTitle("Uygulamayı kullanmaya başla", for: .normal)
        buttonForGoToHomePage.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        buttonForGoToHomePage.frame = CGRect(x: 0, y: 0, width: view.frame.size.width - 40, height: 50)
        buttonForGoToHomePage.setTitleColor(.white, for: .normal)
        buttonForGoToHomePage.layer.cornerRadius = 25
        buttonForGoToHomePage.layer.masksToBounds = true
        buttonForGoToHomePage.applyGradient(colors: [UIColor(rgb: 0x8fc031), UIColor(rgb: 0x5f840f)], startPoint: CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint(x: 0.5, y: 1.0))

        buttonForGoToHomePage.addTarget(self, action: #selector(tappedUseAppButton), for: .touchUpInside)
        view.addSubview(buttonForGoToHomePage)
        NSLayoutConstraint.activate([
            buttonForGoToHomePage.topAnchor.constraint(equalTo: labelAboutSendedMailInfo.bottomAnchor,constant: 25),
            buttonForGoToHomePage.widthAnchor.constraint(equalToConstant: view.frame.size.width - 40),
            buttonForGoToHomePage.heightAnchor.constraint(equalToConstant: 50),
            buttonForGoToHomePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    @objc func tappedUseAppButton() {
        print("tapped use app button")
    }
}
