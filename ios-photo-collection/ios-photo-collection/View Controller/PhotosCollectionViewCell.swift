//
//  PhotosCollectionViewCell.swift
//  ios-photo-collection
//
//  Created by Alex Roberts on 8/2/18.
//  Copyright © 2018 Lambda School Inc. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
	
	private func updateViews() {
		guard let imageData = photo?.imageData else { return }
		imageView.image = UIImage(data: imageData)
		textLabel.text = photo?.title
	}
	
	var photo: Photo? {
		didSet{
			updateViews()
		}
	}
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var textLabel: UILabel!
}
