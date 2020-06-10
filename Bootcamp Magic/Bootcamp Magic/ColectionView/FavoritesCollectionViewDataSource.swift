//
//  FeedCollectionViewDataSource.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 25/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FavoritesCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var favoritesViewModel: FavoritesViewModel?
    var sections: Int?
    var loadingView: CollectionFooterView?
    var isLoading = false
    
    init(viewModel: FavoritesViewModel) {
        self.favoritesViewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let arrayCards = favoritesViewModel?.arrayCards  else { return 0 }
        return arrayCards.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = UICollectionReusableView()

        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CardCollectionViewCell.self, for: indexPath)
        cell.cardCoreData = favoritesViewModel?.arrayCards[indexPath.row]
        
        return cell
    }
   
}
