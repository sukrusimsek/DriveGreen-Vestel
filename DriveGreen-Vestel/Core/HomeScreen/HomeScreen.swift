//
//  HomeScreen.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 30.01.2024.
//

import UIKit
protocol HomeScreenInterface: AnyObject {
    func configureVC()
    func configureStackView()
    func configureLabels()
    func configureAddDeviceButton()
}

class HomeScreen: UIViewController {
    private let viewModel = HomeViewModel()
    private let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    private let stackView = UIStackView()
    private let welcomeLabel = UILabel()
    private let labelSecond = UILabel()
    private let labelBottom = UILabel()
    private let imageForButtonPlus = UIImageView(image: UIImage(systemName: "plus"))
    private let buttonForAddDevice = UIButton(type: .system)
    private let labelAddDevice = UILabel()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
        
    }
}
extension HomeScreen: HomeScreenInterface {
    func configureVC() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        
        navigationItem.hidesBackButton = true
        backgroundImage.image = UIImage(named: "drivegreenback")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        let overlayView = UIView(frame: UIScreen.main.bounds)
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        view.insertSubview(overlayView, aboveSubview: backgroundImage)
        
        
    }
    func configureStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: view.frame.size.width - 70),
            stackView.heightAnchor.constraint(equalToConstant: view.frame.size.width / 2.8),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        ])
    }
    func configureLabels() {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Hoşgeldiniz!"
        welcomeLabel.font = .systemFont(ofSize: 24, weight: .bold, width: .standard)
        welcomeLabel.textColor = .white
        stackView.addArrangedSubview(welcomeLabel)
        
        labelSecond.translatesAutoresizingMaskIntoConstraints = false
        labelSecond.text = "Görünüşe göre henüz cihaz eklemediniz."
        labelSecond.font = .systemFont(ofSize: 16, weight: .semibold)
        labelSecond.textColor = .white
        stackView.addArrangedSubview(labelSecond)
        
        labelBottom.translatesAutoresizingMaskIntoConstraints = false
        labelBottom.numberOfLines = 0
        labelBottom.textAlignment = .center
        
        let firstSt = "\"Cihaz ekle\" "
        let firstAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(rgb: 0x8fc031)
        ]
        let attributesFirstStr = NSAttributedString(string: firstSt, attributes: firstAttributes)

        let secondSt = "butonuna basarak, yeni bir cihaz ekleyin ve uygulamayı kullanmaya başlayın."
        let secondAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        let attributesSecondStr = NSAttributedString(string: secondSt, attributes: secondAttributes)
        let fullStr = NSMutableAttributedString()
        fullStr.append(attributesFirstStr)
        fullStr.append(attributesSecondStr)
        labelBottom.attributedText = fullStr
        
        stackView.addArrangedSubview(labelBottom)
        
    }
    func configureAddDeviceButton() {
        imageForButtonPlus.tintColor = UIColor(rgb: 0x8fc031)
        imageForButtonPlus.frame = CGRect(x: 12, y: 12, width: 36, height: 36)
        labelAddDevice.translatesAutoresizingMaskIntoConstraints = false
        labelAddDevice.text = "Cihaz Ekle"
        labelAddDevice.font = .systemFont(ofSize: 14, weight: .semibold)
        labelAddDevice.textColor = .white
        labelAddDevice.numberOfLines = 1
        labelAddDevice.textAlignment = .center
        
        buttonForAddDevice.translatesAutoresizingMaskIntoConstraints = false
        buttonForAddDevice.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        buttonForAddDevice.applyGradient(colors: [UIColor.darkGray, UIColor.gray, UIColor.lightGray], startPoint: CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint(x: 0.5, y: 1.0), locations: [0.0,0.5,0.9])
        addBorderGradient(to: buttonForAddDevice, startColor: .lightGray, endColor: .lightText, lineWidth: 3.0, startPoint: .topCenter, endPoint: .bottomCenter)
        buttonForAddDevice.addTarget(self, action: #selector(tappedAddDevice), for: .touchUpInside)
        buttonForAddDevice.tintColor = .green
        buttonForAddDevice.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 32), forImageIn: .normal)
        view.addSubview(buttonForAddDevice)
        buttonForAddDevice.addSubview(imageForButtonPlus)
        view.addSubview(labelAddDevice)
        NSLayoutConstraint.activate([
            buttonForAddDevice.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -40),
            buttonForAddDevice.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonForAddDevice.widthAnchor.constraint(equalToConstant: 60),
            buttonForAddDevice.heightAnchor.constraint(equalToConstant: 60),
            
            labelAddDevice.topAnchor.constraint(equalTo: buttonForAddDevice.bottomAnchor, constant: 5),
            labelAddDevice.widthAnchor.constraint(equalToConstant: buttonForAddDevice.frame.width + 20),
            labelAddDevice.trailingAnchor.constraint(equalTo: buttonForAddDevice.trailingAnchor, constant: 10),
        ])
    }
    @objc func tappedAddDevice() {
        print("tapped")
    }
}
