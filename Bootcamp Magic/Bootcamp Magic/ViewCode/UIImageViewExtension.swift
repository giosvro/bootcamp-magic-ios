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

        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] 
        self.addSubview(blurEffectView)
    }
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
        
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        let correctUrl = "http://image.tmdb.org/t/p/w154/" + link
        guard let url = URL(string: correctUrl) else { return }
        downloaded(from: url, contentMode: mode)
    }

}
