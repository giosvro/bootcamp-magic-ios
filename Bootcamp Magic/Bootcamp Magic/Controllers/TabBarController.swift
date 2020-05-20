//
//  TabBarController.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedViewController = FeedViewController()
        feedViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)

        let favoritesViewController = FavoritesViewController()
        favoritesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        let viewControllerList = [feedViewController, favoritesViewController]
        viewControllers = viewControllerList
    }
    
//    let bookmarkViewController = BookmarksViewController()
//    bookmarkViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .Bookmarks, tag: 1)
//    let favoritesViewControllers = FavoritesViewController()
//    favoritesViewControllers.tabBarItem = UITabBarItem(tabBarSystemItem: .Favorites, tag: 2)
//    let viewControllerList = [ downloadViewController, bookmarkViewController, favoritesViewControllers ]
//    viewControllers = viewControllerList
}
