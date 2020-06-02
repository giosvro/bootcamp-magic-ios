//
//  FavoriteController.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var favoritesViewModel = FavoritesViewModel()
    var collectionView: UICollectionView?
    var dataSource: FavoritesCollectionViewDataSource!
    var coordinator: Coordinator?

    override func loadView() {
        let view = FavoritesView()
        view.delegate = self
        favoritesViewModel.delegate = self
        self.collectionView = view.collectionView
        self.collectionView?.delegate = self
        self.dataSource = FavoritesCollectionViewDataSource(viewModel: favoritesViewModel)
        self.collectionView?.dataSource = dataSource
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesViewModel.loadCards()
    }
}

extension FavoritesViewController: UICollectionViewDelegate {
    

}

extension FavoritesViewController: ViewDelegate {
    
    func didButtonPressed() {
        guard let coodinator = coordinator as? FavoritesCoordinator else {
            return
        }
    }

}
