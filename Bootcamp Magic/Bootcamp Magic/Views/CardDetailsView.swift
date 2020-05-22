//
//  CardDetailsView.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 22/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class CardDetailsView: UIView {
    
    var blurredBackgroundImageView: UIImageView
    
    weak var delegate: ViewDelegate?
    
    override init(frame: CGRect) {
        blurredBackgroundImageView = UIImageView()
        super.init(frame: frame)
        blurredBackgroundImageView.frame = frame
        setup()
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
}

extension CardDetailsView: ViewCoding {
    func hierarchyView() {
        addView(blurredBackgroundImageView)
    }
    
    func constraintView() {
        
    }
    
    func aditionalConfigView() {
        blurredBackgroundImageView.image = UIImage(named: "background")
        blurredBackgroundImageView.blurImage()
    }
}
