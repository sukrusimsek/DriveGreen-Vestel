//
//  SceneDelegate.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 21.01.2024.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let currenctUser = Auth.auth().currentUser
        
        if currenctUser != nil {
            let vc = HomeScreen()
            window?.rootViewController = vc
        }
        
        
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: HomeScreen())
        window?.makeKeyAndVisible()
        
    }

    func showTabBarCont() {
        let tabBar = UITabBarController()
        let vc1 = HomeScreen()
        let vc2 = SettingScreen()
        let vc3 = ProfileScreen()
        vc1.tabBarItem.image = UIImage(systemName: "square.grid.2x2.fill")
        vc2.tabBarItem.image = UIImage(systemName: "wrench.adjustable.fill")
        vc3.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        tabBar.tabBar.tintColor = UIColor(rgb: 0x8fc031)
        tabBar.tabBar.unselectedItemTintColor = .lightText
        tabBar.tabBar.backgroundColor = UIColor(rgb: 0x444444)
        vc1.title = "Ana Sayfa"
        vc2.title = "Ayarlar"
        vc3.title = "Profil"
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        tabBar.viewControllers = [nav1, nav2, nav3]
        window?.rootViewController = tabBar
    }

}

