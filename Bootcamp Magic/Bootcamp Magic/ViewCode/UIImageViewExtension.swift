//
//  UIImageViewExtension.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 21/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

extension UIImageView{
    func blurImage()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds

        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
}
