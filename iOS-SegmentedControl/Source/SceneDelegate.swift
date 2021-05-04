//
//  SceneDelegate.swift
//  iOS-SegmentedControl
//
//  Created by Emiliano Barbosa on 03/05/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        guard let w = window else { return }
        
        w.backgroundColor = UIColor(named: "background")
        let rootNavigationController = HomeViewController()
        
        w.rootViewController = rootNavigationController
        w.makeKeyAndVisible()
    }
    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    func sceneDidEnterBackground(_ scene: UIScene) { }
}

