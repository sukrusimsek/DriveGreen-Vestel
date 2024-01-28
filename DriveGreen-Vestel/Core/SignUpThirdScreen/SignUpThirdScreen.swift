//
//  SignUpThirdScreen.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 28.01.2024.
//

import UIKit
protocol SignUpThirdScreenInterface: AnyObject {
    func configureVC()
    func configureShowPages()
    func configureLabelAndIcon()
    func configureSendAgainMailButton()
}

final class SignUpThirdScreen: UIViewController {
    private let viewModel = SignUpThirdViewModel()
    private let viewForPageShowStackView = UIStackView()
    private let iconView = UIImageView()
    private let labelForActivation1 = UILabel()
    private let labelForActivation2 = UILabel()
    private let labelAboutQuestion = UILabel()
    private let buttonAboutSendAgain = UIButton()
    let iconForName = UIImage(systemName: "person.crop.circle")
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
    }
}
extension SignUpThirdScreen: SignUpThirdScreenInterface {
    func configureVC() {
        let backButton = UIButton(type: .custom)
        backButton.setTitle("İptal", for: .normal)
        backButton.setTitleColor(.lightGray, for: .normal)
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.title = "Aktivasyon"
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        view.backgroundColor = UIColor(rgb: 0x444444)
        
    }
    @objc func tappedBackButton() {
        if let viewControllers = navigationController?.viewControllers {
            if viewControllers.count >= 4 {
                let targetViewController = viewControllers[viewControllers.count - 4]
                navigationController?.popToViewController(targetViewController, animated: true)
            }
        }
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
        view4.showPageIndicator(color: UIColor(rgb: 0xB6BBC4), width: (view.frame.size.width/4) - 2)
        viewForPageShowStackView.addArrangedSubview(view1)
        viewForPageShowStackView.addArrangedSubview(view2)
        viewForPageShowStackView.addArrangedSubview(view3)
        viewForPageShowStackView.addArrangedSubview(view4)
    }
    func configureLabelAndIcon() {
        iconView.translatesAutoresizingMaskIntoConstraints = false
        labelForActivation1.translatesAutoresizingMaskIntoConstraints = false
        labelForActivation2.translatesAutoresizingMaskIntoConstraints = false
        labelAboutQuestion.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = UIImage(systemName: "envelope.open")
        iconView.tintColor = .lightText
        view.addSubview(iconView)
        
        labelForActivation1.text = "Aktivasyon e-postanız gönderildi."
        labelForActivation1.textColor = .white
        labelForActivation1.font = .systemFont(ofSize: 14, weight: .regular)
        labelForActivation1.textAlignment = .center
        view.addSubview(labelForActivation1)
        labelForActivation2.text = "Gelen kutunuzdaki linke tıklayarak üyeliğinizi tamamlayabilirsiniz."
        labelForActivation2.numberOfLines = 0
        labelForActivation2.textColor = .white
        labelForActivation2.font = .systemFont(ofSize: 14, weight: .semibold)
        labelForActivation2.textAlignment = .center
        view.addSubview(labelForActivation2)
        labelAboutQuestion.text = "E-posta gelmedi mi?"
        labelAboutQuestion.textColor = .white
        labelAboutQuestion.textAlignment = .center
        labelAboutQuestion.font = .systemFont(ofSize: 14, weight: .semibold)
        view.addSubview(labelAboutQuestion)
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -30),
            iconView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 90),
            iconView.heightAnchor.constraint(equalToConstant: 75),
            
            labelForActivation1.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10),
            labelForActivation1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelForActivation1.widthAnchor.constraint(equalToConstant: view.frame.width - 20),
            labelForActivation2.topAnchor.constraint(equalTo: labelForActivation1.bottomAnchor, constant: 5),
            labelForActivation2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelForActivation2.widthAnchor.constraint(equalToConstant: view.frame.width - 20),
            labelAboutQuestion.topAnchor.constraint(equalTo: labelForActivation2.bottomAnchor, constant: 20),
            labelAboutQuestion.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    func configureSendAgainMailButton() {
        buttonAboutSendAgain.translatesAutoresizingMaskIntoConstraints = false
        buttonAboutSendAgain.setTitle("Tekrar Gönder", for: .normal)
        buttonAboutSendAgain.setTitleColor(UIColor(rgb: 0x8fc031), for: .normal)
        buttonAboutSendAgain.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        buttonAboutSendAgain.addTarget(self, action: #selector(tappedSendAgainMail), for: .touchUpInside)
        view.addSubview(buttonAboutSendAgain)
        NSLayoutConstraint.activate([
            buttonAboutSendAgain.topAnchor.constraint(equalTo: labelAboutQuestion.bottomAnchor, constant: 10),
            buttonAboutSendAgain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    @objc func tappedSendAgainMail() {
        
        let alertController = UIAlertController(title: "", message: "E-postanıza bir aktivasyon kodu gönderilecektir. \n Parolanızı unuttuysanız, kayıtlı e-posta adresinizi kullanarak parolanızı sıfırlayabilirsiniz.", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 ) {
            alertController.dismiss(animated: true, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
            //go to new page
        }
    }
    
}
