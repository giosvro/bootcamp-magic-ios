//
//  CardImageView.swift
//  Bootcamp Magic
//
//  Created by giovanni.s.barros on 28/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit


class CardImageView: UIImageView {
    
    var imageUrl: String?
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        self.image = nil
        self.contentMode = mode
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as NSString) {
            self.image = imageFromCache
            return
        }
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            DispatchQueue.main.async() { [weak self] in
                guard let self = self else { return }

                let imageToCache = image

                if self.imageUrl == url.absoluteString {
                    self.image = image
                }
                
                imageCache.setObject(imageToCache, forKey: url.absoluteString as NSString)
            }
        }.resume()
    }
        
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }

}

