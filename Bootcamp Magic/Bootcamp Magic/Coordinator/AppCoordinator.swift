//
//  AppCoordinator.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var window: UIWindow
    var rootViewController: UIViewController
    
    private let favoritesViewController: FavoritesViewController
    private let feedViewController: FeedViewController
    
    init() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        self.rootViewController = TabBarController()
        self.favoritesViewController = FavoritesViewController()
        self.feedViewController = FeedViewController()
    }
    
    func start() {
        setupWindow()
        setupTabBar()
    }
    
    private func setupWindow() {
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }

    private func setupTabBar() {
        
    }
}


//// MARK: - Setup Tab Bar
//private func setupTabBar() {
//    let moviesViewController = moviesCoordinator.rootViewController
//    let favoritesViewController = favoritesCoordinator.rootViewController
//
//    let moviesNavigation = UINavigationController(rootViewController: moviesViewController)
//    let favoritesNavigation = UINavigationController(rootViewController: favoritesViewController)
//
//    moviesNavigation.navigationBar.prefersLargeTitles = true
//    moviesNavigation.navigationBar.isTranslucent = false
//    moviesNavigation.navigationItem.largeTitleDisplayMode = .automatic
//    moviesNavigation.navigationBar.barTintColor = .black
//    moviesNavigation.navigationBar.tintColor = .white
//    moviesNavigation.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
//    moviesNavigation.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//
//    favoritesNavigation.navigationBar.prefersLargeTitles = true
//    favoritesNavigation.navigationBar.isTranslucent = false
//    favoritesNavigation.navigationItem.largeTitleDisplayMode = .automatic
//    favoritesNavigation.navigationBar.barTintColor = .black
//    favoritesNavigation.navigationBar.tintColor = .white
//    favoritesNavigation.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
//    favoritesNavigation.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//
//    let moviesItem = UITabBarItem(title: "Movies",
//                                  image: UIImage(named: "list_icon"),
//                                  selectedImage: UIImage(named: "list_icon"))
//
//    let favoritesItem = UITabBarItem(title: "Favorites",
//                                     image: UIImage(named: "favorite_empty_icon"),
//                                     selectedImage: UIImage(named: "favorite_empty_icon"))
//
//    moviesNavigation.tabBarItem = moviesItem
//    favoritesNavigation.tabBarItem = favoritesItem
//
//    var controllers: [UIViewController] = []
//    controllers.append(moviesNavigation)
//    controllers.append(favoritesNavigation)
//
//    guard let tabBarController = rootViewController as? TabBarController else { return }
//    tabBarController.viewControllers = controllers
//}
