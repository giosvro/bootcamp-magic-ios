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
        guard let categoryCount = feedViewModel?.sectionsCollection else { return 1}
        let sections = categoryCount + 1
        print("sections----- \(sections )")
        return sections
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
            
            guard let types = feedViewModel?.types else { return view }
            guard let iterator = feedViewModel?.iteratorType else { return view }
        
            reusableview.label.text = types[iterator]
            
        }
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CardCollectionViewCell.self, for: indexPath)
        cell.card = feedViewModel?.arrayCards?[indexPath.row]
        
        return cell
    }
}
