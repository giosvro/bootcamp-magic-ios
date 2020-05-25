//
//  CardCollectionViewCell.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 25/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    let identiifier = "CardCollectionViewCell"
    
    var card: Card? {
        didSet {
            configureCard()
        }
    }
    
    private func configureCard(){
        
    }
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//        self.isUserInteractionEnabled = true
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
