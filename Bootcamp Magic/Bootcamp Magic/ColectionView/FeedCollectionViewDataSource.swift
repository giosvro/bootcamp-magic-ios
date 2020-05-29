//
//  FeedCollectionViewDataSource.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 25/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FeedCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var feedViewModel: FeedViewModel?
    
    init(viewModel: FeedViewModel) {
        self.feedViewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedViewModel?.arrayCards?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var view: UICollectionReusableView? = nil
        
        if kind == UICollectionView.elementKindSectionHeader {
            guard let reusableview = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, withReuseIdentifier: "\(CardsHeaderView.self)",
                for: indexPath) as? CardsHeaderView else {
                return UICollectionReusableView()
            }
            
            view = reusableview
            
            if indexPath.section == 0 {
                reusableview.label.text = "Creature"
            }
        }
        return view!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CardCollectionViewCell.self, for: indexPath)
        cell.card = feedViewModel?.arrayCards?[indexPath.row]
        
        return cell
    }
}
