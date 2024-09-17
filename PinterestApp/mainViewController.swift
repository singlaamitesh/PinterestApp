//
//  mainViewController.swift
//  PinterestApp
//
//  Created by Amitesh Gupta on 06/09/24.
//

import UIKit

class mainViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var ImageCell: ImageCell!
    
    @IBOutlet weak var searchBar: UISearchBar!

    var images: [ImageModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // Handle search when the user clicks the search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        APIClient.shared.fetchImages(searchTerm: searchTerm) { [weak self] images in
            DispatchQueue.main.async {
                self?.images = images
                self?.collectionView.reloadData()
            }
        }
    }

    // CollectionView Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        let image = images[indexPath.row]
        cell.configure(with: image)
        return cell
    }
}
