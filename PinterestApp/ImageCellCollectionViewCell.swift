//
//  ImageCellCollectionViewCell.swift
//  PinterestApp
//
//  Created by Amitesh Gupta on 06/09/24.
//

import UIKit

class ImageCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!

        func configure(with image: ImageModel) {
            guard let url = URL(string: image.urls.small) else { return }

            // Load image asynchronously
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }
        }
    
}
