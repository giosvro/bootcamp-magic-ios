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
    var tittleLabel = UILabel()

    override func loadView() {
        let view = FavoritesView()
        view.delegate = self
        tittleLabel = view.label
        favoritesViewModel.delegate = self
        self.collectionView = view.collectionView
        self.collectionView?.delegate = self
        self.dataSource = FavoritesCollectionViewDataSource(viewModel: favoritesViewModel)
        self.collectionView?.dataSource = dataSource
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        favoritesViewModel.loadCards()
    }
}

extension FavoritesViewController: UICollectionViewDelegate {
    func reloadCollection() {
        tittleLabel.text = "Favorite Cards"
        let quantity = favoritesViewModel.arrayCards.count
        if quantity != 0{
            tittleLabel.text = "Favorite Cards (\(quantity))"
        }
        
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
            self.collectionView?.isHidden = false
            self.view.activityStopAnimating()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cardCell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell else { return }
        favoritesViewModel.showCard(indexPath: indexPath, cardImage: cardCell.cardImage.image)
    }

}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let usableWidth = collectionView.frame.width * 0.29
        
        let cellWidth: CGFloat = usableWidth
        let cellHeight: CGFloat = usableWidth * 1.4
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension FavoritesViewController: ViewDelegate {
    
    func didButtonPressed() {
        
    }

}
