//
//  ImageCell.swift
//  PinterestApp
//
//  Created by Amitesh Gupta on 07/09/24.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!

   
    func configure(with image: ImageModel) {
      
        if let url = URL(string: image.urls.small) {
            
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
