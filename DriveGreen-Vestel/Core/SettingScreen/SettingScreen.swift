//
//  ViewController.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 22.01.2024.
//

import UIKit
import PDFKit

protocol SettingScreenInterface: AnyObject {
    func configureVC()
    func configurePDFView()
    func configureShowPages()
    func configureAcceptButtons()
    func configureGoButton()
}

final class SettingScreen: UIViewController {
    private let viewModel = SettingViewModel()
    private let pdfViewForSubsAbout = PDFView()
    private let pdfViewForPrivacyPolicy = PDFView()
    private let viewForPageShowStackView = UIStackView()
    private let buttonForSubs = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
    private let buttonForPrivacyPolicy = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
    var isButtonClickedForMemberships = false //Control for membership agreement button
    var isButtonClickedForPrivacyPolicy = false //Control for privacy agreement button
    private let continueButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
        
    }

}
extension SettingScreen: SettingScreenInterface {
    func configureVC() {
        let backButton = UIButton(type: .custom)
        backButton.tintColor = UIColor(rgb: 0x8fc031)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.title = "Üyelik Sözleşmesi"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        view.backgroundColor = UIColor(rgb: 0x444444)
    }
    @objc func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }

    func configurePDFView() {
        pdfViewForSubsAbout.translatesAutoresizingMaskIntoConstraints = false
        pdfViewForSubsAbout.backgroundColor = UIColor(rgb: 0x191919)
        pdfViewForSubsAbout.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pdfViewForSubsAbout.displayMode = .singlePageContinuous
        pdfViewForSubsAbout.autoScales = true
        pdfViewForSubsAbout.displayDirection = .vertical
        view.addSubview(pdfViewForSubsAbout)
        NSLayoutConstraint.activate([
            pdfViewForSubsAbout.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            pdfViewForSubsAbout.widthAnchor.constraint(equalToConstant: view.frame.size.width - 20),
            pdfViewForSubsAbout.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pdfViewForSubsAbout.heightAnchor.constraint(equalToConstant: view.frame.size.height / 3.2),
        ])
        guard let path = Bundle.main.url(forResource: "sample", withExtension: "pdf") else { return }
        if let document  = PDFDocument(url: path) {
            pdfViewForSubsAbout.document = document
        }
        
        pdfViewForPrivacyPolicy.translatesAutoresizingMaskIntoConstraints = false
        pdfViewForPrivacyPolicy.backgroundColor = UIColor(rgb: 0x191919)
        pdfViewForPrivacyPolicy.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pdfViewForPrivacyPolicy.displayMode = .singlePageContinuous
        pdfViewForPrivacyPolicy.autoScales = true
        pdfViewForPrivacyPolicy.displayDirection = .vertical
        view.addSubview(pdfViewForPrivacyPolicy)
        NSLayoutConstraint.activate([
            pdfViewForPrivacyPolicy.topAnchor.constraint(equalTo: pdfViewForSubsAbout.bottomAnchor,constant: 10),
            pdfViewForPrivacyPolicy.widthAnchor.constraint(equalToConstant: view.frame.size.width - 20),
            pdfViewForPrivacyPolicy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pdfViewForPrivacyPolicy.heightAnchor.constraint(equalToConstant: view.frame.size.height / 3.2),
        ])
        guard let pathPrivacy = Bundle.main.url(forResource: "sample", withExtension: "pdf") else { return }
        if let documentPrivacy  = PDFDocument(url: pathPrivacy) {
            pdfViewForPrivacyPolicy.document = documentPrivacy
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
        view2.showPageIndicator(color: UIColor(rgb: 0xB6BBC4), width: (view.frame.size.width/4) - 2)
        let view3 = UIView()
        view3.showPageIndicator(color: UIColor(rgb: 0xB6BBC4), width: (view.frame.size.width/4) - 2)
        let view4 = UIView()
        view4.showPageIndicator(color: UIColor(rgb: 0xB6BBC4), width: (view.frame.size.width/4) - 2)
        viewForPageShowStackView.addArrangedSubview(view1)
        viewForPageShowStackView.addArrangedSubview(view2)
        viewForPageShowStackView.addArrangedSubview(view3)
        viewForPageShowStackView.addArrangedSubview(view4)
    }
    func configureAcceptButtons() {
        
        buttonForSubs.translatesAutoresizingMaskIntoConstraints = false
        buttonForPrivacyPolicy.translatesAutoresizingMaskIntoConstraints = false
        
        buttonForSubs.setTitle("  Üyelik Sözleşmesini okudum ve kabul ediyorum.", for: .normal)
        buttonForSubs.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        buttonForPrivacyPolicy.setTitle("  Gizlilik Politikasını okudum ve kabul ediyorum.", for: .normal)
        buttonForPrivacyPolicy.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        
        buttonForSubs.setImage(UIImage(systemName: "circle"), for: .normal)
        buttonForSubs.tintColor = .lightGray
        buttonForPrivacyPolicy.setImage(UIImage(systemName: "circle"), for: .normal)
        buttonForPrivacyPolicy.tintColor = .lightGray
        
        
        buttonForSubs.addTarget(self, action: #selector(tappedSubsAgreement), for: .touchUpInside)
        buttonForPrivacyPolicy.addTarget(self, action: #selector(tappedPolicyPrivacy), for: .touchUpInside)

        view.addSubview(buttonForSubs)
        view.addSubview(buttonForPrivacyPolicy)
        NSLayoutConstraint.activate([
            buttonForSubs.topAnchor.constraint(equalTo: pdfViewForPrivacyPolicy.bottomAnchor, constant: 20),
            buttonForSubs.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            buttonForPrivacyPolicy.topAnchor.constraint(equalTo: buttonForSubs.bottomAnchor, constant: 10),
            buttonForPrivacyPolicy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ])
    }
    @objc func tappedSubsAgreement() {
        if isButtonClickedForMemberships {
            buttonForSubs.setImage(UIImage(systemName: "circle"), for: .normal)
            buttonForSubs.tintColor = .lightGray
        } else {
            //accepted
            buttonForSubs.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            buttonForSubs.tintColor = UIColor(rgb: 0x8fc031)
        }
        isButtonClickedForMemberships = !isButtonClickedForMemberships//change the click type
        
        //The place that checks that the necessary permissions have been granted.
        if isButtonClickedForMemberships && isButtonClickedForPrivacyPolicy {
            continueButton.isEnabled = true
            continueButton.setTitleColor(.white, for: .normal)
            continueButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        } else {
            continueButton.isEnabled = false
            continueButton.setTitleColor(.lightText, for: .normal)
            continueButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        }
    }
    @objc func tappedPolicyPrivacy() {
        if isButtonClickedForPrivacyPolicy {
            buttonForPrivacyPolicy.setImage(UIImage(systemName: "circle"), for: .normal)
            buttonForPrivacyPolicy.tintColor = .lightText
        } else {
            //accepted
            buttonForPrivacyPolicy.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            buttonForPrivacyPolicy.tintColor = UIColor(rgb: 0x8fc031)
        }
        isButtonClickedForPrivacyPolicy = !isButtonClickedForPrivacyPolicy//change the click type
        
        //The place that checks that the necessary permissions have been granted.
        if isButtonClickedForMemberships && isButtonClickedForPrivacyPolicy {
            continueButton.isEnabled = true
            continueButton.setTitleColor(.white, for: .normal)
            continueButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        } else {
            continueButton.isEnabled = false
            continueButton.setTitleColor(.lightText, for: .normal)
            continueButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        }
    }
    func configureGoButton() {
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
            continueButton.topAnchor.constraint(equalTo: buttonForPrivacyPolicy.bottomAnchor, constant: 10),
            continueButton.widthAnchor.constraint(equalToConstant: view.frame.size.width - 40),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

    }
    @objc func tappedContinueButton() {
        print("taipped continue")
    }
}
