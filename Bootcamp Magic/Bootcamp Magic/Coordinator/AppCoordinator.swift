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
    
    private let favoritesCoordinator: FavoritesCoordinator
    private let feedCoordinator: FeedCoordinator
    
    init() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        self.rootViewController = TabBarController()
        self.favoritesCoordinator = FavoritesCoordinator()
        self.feedCoordinator = FeedCoordinator()
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
        let favoriteViewController = favoritesCoordinator.rootViewController
        let feedViewController = feedCoordinator.rootViewController
        
        let feedItem = UITabBarItem(title: "Feed", image: UIImage(named: "cards"), selectedImage: nil)
        let FavoritesItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favorite"), selectedImage: nil)
        
        favoriteViewController.tabBarItem = FavoritesItem
        feedViewController.tabBarItem = feedItem
        
        var controllers: [UIViewController] = []
        controllers.append(feedViewController)
        controllers.append(favoriteViewController)
        
        guard let tabBarController = rootViewController as? TabBarController else { return }
        
        tabBarController.viewControllers = controllers
    }
}

