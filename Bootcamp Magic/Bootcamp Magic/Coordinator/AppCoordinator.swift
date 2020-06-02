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
    var childCoordinators = [Coordinator]()
    
    init() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        self.rootViewController = TabBarController()
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
        
        var controllers: [UIViewController] = []
        
        let feedCoordinator = FeedCoordinator()
        childCoordinators.append(feedCoordinator)

        if let feedViewController = feedCoordinator.rootViewController as? FeedViewController {

            let feedItem = UITabBarItem(title: "Feed", image: UIImage(named: "cards"), selectedImage: nil)
            feedViewController.tabBarItem = feedItem
            feedViewController.feedViewModel.coordinatorDelegate = feedCoordinator
            controllers.append(feedViewController)
        }
        
        let favoritesCoordinator = FavoritesCoordinator()
        childCoordinators.append(favoritesCoordinator)
        
        if let favoriteViewController = favoritesCoordinator.rootViewController as? FavoritesViewController {

            let FavoritesItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favorite"), selectedImage: nil)
            favoriteViewController.tabBarItem = FavoritesItem
            favoriteViewController.favoritesViewModel.coordinatorDelegate = favoritesCoordinator
            controllers.append(favoriteViewController)
        }
        
        guard let tabBarController = rootViewController as? TabBarController else { return }
        
        tabBarController.viewControllers = controllers
    }
}

