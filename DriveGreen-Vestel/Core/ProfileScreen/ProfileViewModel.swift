//
//  ProfileViewModel.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 31.01.2024.
//

import Foundation

protocol ProfileViewModelInterface {
    var view: ProfileScreenInterface? { get set }
    func viewDidLoad()
}


final class ProfileViewModel {
    weak var view: ProfileScreenInterface?
}

extension ProfileViewModel: ProfileViewModelInterface {

    
    func viewDidLoad() {
        view?.configureVC()
    }
}
