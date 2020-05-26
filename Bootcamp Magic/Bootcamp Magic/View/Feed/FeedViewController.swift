//
//  FeedController.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    let feedViewModel = FeedViewModel()
    var collectionView: UICollectionView?
    
    override func loadView() {
        let view = FeedView()
        feedViewModel.delegate = self
        view.delegate = self
        self.collectionView = view.collectionView
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = FeedCollectionViewDataSource(viewModel: feedViewModel)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedViewModel.loadCards()
    }
}

extension FeedViewController: ViewDelegate {
    func didButtonPressed() {
        
    }
    
}

extension FeedViewController: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let card = indexPath.item as? Card else {
//            return
//        }
//        feedViewModel.showCard(card: card)
    }
    
    func reloadCollection() {
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
            
        }
    }
}
