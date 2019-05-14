//
//  AppDelegate.swift
//  CityGame
//
//  Created by karol.nadratowaski on 2019-04-01.
//  Copyright © 2019 Apolej Developer. All rights reserved.
//

import UIKit
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var mainFlowController: FlowController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let rootNavigationController = UINavigationController()
        window?.rootViewController = rootNavigationController
        mainFlowController = MainFlowController(rootNavigationController: rootNavigationController)
        mainFlowController.startFlow()
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        return true
    }

}
