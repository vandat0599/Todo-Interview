//
//  AppDelegate.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    fileprivate func setupWindow() {
        window = UIWindow()
        let homeNavigationController = UINavigationController()
        let homeViewController = HomeViewController(
            viewModel: HomeViewModel(navigator: HomeNavigator(navigationController: homeNavigationController))
        )
        homeNavigationController.setViewControllers([homeViewController], animated: false)
        let rootViewController = homeNavigationController
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }

    // MARK: - Lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupWindow()
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        CoreDataStack.shared.saveContext()
    }

}

