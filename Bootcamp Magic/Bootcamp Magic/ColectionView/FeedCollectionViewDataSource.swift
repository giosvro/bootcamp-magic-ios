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
    var sections: Int?
    
    init(viewModel: FeedViewModel) {
        self.feedViewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let arrayCollectionCards = feedViewModel?.arrayCollectionCards  else { return 0 }
        return arrayCollectionCards[section].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let arrayCollectionCards = feedViewModel?.arrayCollectionCards  else { return 0 }
        return arrayCollectionCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var view = UICollectionReusableView()
        
        if kind == UICollectionView.elementKindSectionHeader {
            guard let reusableview = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind, withReuseIdentifier: "\(CardsHeaderView.self)",
                for: indexPath) as? CardsHeaderView else {
                return UICollectionReusableView()
            }
            
            view = reusableview
            
            guard let currentSectionType = feedViewModel?.currentSectionType else { return view }
            
            for sectionNumber in 0...currentSectionType.count {
                if indexPath.section == sectionNumber {
                    reusableview.label.text = currentSectionType[sectionNumber]
                }
            }
            
        }
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CardCollectionViewCell.self, for: indexPath)
        cell.card = feedViewModel?.arrayCollectionCards[indexPath.section][indexPath.row]
        
        return cell
    }
}
