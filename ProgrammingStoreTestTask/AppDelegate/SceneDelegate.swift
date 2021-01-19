//
//  SceneDelegate.swift
//  ProgrammingStoreTestTask
//
//  Created by Maxim Tolstikov on 19.01.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = self.window ?? UIWindow(windowScene: windowScene)
        let controllersFactory = ControllersFactoryImp()
        window?.rootViewController = controllersFactory.displayedController()
        window?.makeKeyAndVisible()
    }

}

