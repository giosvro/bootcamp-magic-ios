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
    
    var cardImage: CardImageView = {
        let imageView = CardImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var card: Card? {
        didSet {
            configureCard()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(cardImage)
        self.isUserInteractionEnabled = true
        self.backgroundColor = .clear
        constraintView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureCard(){
        guard let urlImage = card?.imageUrl else {
            return
        }
        DispatchQueue.main.async {
            self.cardImage.imageUrl = urlImage
            self.cardImage.downloaded(from: urlImage, contentMode: .scaleAspectFit)
        }
    }
    
    private func constraintView() {
        NSLayoutConstraint.activate(
            [cardImage.topAnchor.constraint(equalTo: contentView.topAnchor),
             cardImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             cardImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             cardImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ]
        )
        
    }
    
    override func prepareForReuse() {
        self.cardImage.image = nil
    }
}
