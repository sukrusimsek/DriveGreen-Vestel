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
    //private let addDeviceButton = UIButton()
    private let iconForAdd = UIImage(systemName: "plus")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
        
    }
}
extension HomeScreen: HomeScreenInterface {
    func configureVC() {
        navigationItem.hidesBackButton = true
        backgroundImage.image = UIImage(named: "drivegreenback")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        let overlayView = UIView(frame: UIScreen.main.bounds)
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        view.insertSubview(overlayView, aboveSubview: backgroundImage)
        
        title = ""
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
        
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .green
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 32), forImageIn: .normal)
        button.applyGradient(colors: [UIColor.darkGray, UIColor.gray, UIColor.lightGray], startPoint: CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint(x: 0.5, y: 1.0), locations: [0.0,0.2,0.7])
        addBorderGradient(to: button, startColor: .lightGray, endColor: .lightText, lineWidth: 3.0, startPoint: .topCenter, endPoint: .bottomCenter)
        button.addTarget(self, action: #selector(tappedAddDevice), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -40),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.widthAnchor.constraint(equalToConstant: 60),
            button.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
    @objc func tappedAddDevice() {
        print("tapped")
    }
}
