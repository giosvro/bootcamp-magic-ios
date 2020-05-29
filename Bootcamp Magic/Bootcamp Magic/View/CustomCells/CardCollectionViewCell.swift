//
//  CardCollectionViewCell.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 25/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.isHidden = true
        return label
    }()
    
    var cardImage: CardImageView = {
        let imageView = CardImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    var card: Card? {
        didSet {
            configureCard()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addView(cardImage, nameLabel)
        self.isUserInteractionEnabled = true
        self.backgroundColor = .clear
        constraintView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureCard(){
        guard let card = card else { return }
        
        if let urlImage = card.imageUrl  {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.cardImage.imageUrl = urlImage
                self.cardImage.downloaded(from: urlImage, contentMode: .scaleAspectFit)
                self.nameLabel.isHidden = true
            }
        } else {
            cardImage.image = UIImage(named: "place-holder")
            nameLabel.text = card.name
            nameLabel.isHidden = false
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
        
        NSLayoutConstraint.activate(
            [nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  13),
             nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
             nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 35)
            ]
        )
    }
    
    override func prepareForReuse() {
        self.cardImage.image = nil
    }
}
