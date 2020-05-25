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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell = CardCollectionViewCell()
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cardCell.identiifier, for: indexPath) as? CardCollectionViewCell else {
            fatalError("Wrong Cell ID")
        }
        
        cell.card = feedViewModel?.arrayCards?[indexPath.row]
        
        return cell
    }
    
    
    
}
