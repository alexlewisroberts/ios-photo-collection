//
//  PhotosCollectionViewController.swift
//  ios-photo-collection
//
//  Created by Alex Roberts on 8/2/18.
//  Copyright © 2018 Lambda School Inc. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showPhotoSegue" {
			if let vc = segue.destination as? PhotoDetailViewController {
				guard let indexPath = self.collectionView!.indexPathsForSelectedItems?.first else { return }
				vc.photoController = photoController
				vc.themeHelper = themeHelper
				vc.photo = photoController.photos[indexPath.item]
			}
		} else if segue.identifier == "addPhotoSegue" {
			if let vc = segue.destination as? PhotoDetailViewController {
				vc.photoController = photoController
				vc.themeHelper = themeHelper
			}
		} else if segue.identifier == "selectThemeSegue" {
			if let vc = segue.destination as? ThemeSelectionViewController {
				vc.themeHelper = themeHelper
			}
		} else { return }
	}


    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
		guard let photoCell = cell as? PhotosCollectionViewCell else { return cell }
		
		let photo = photoController.photos[indexPath.row]
		photoCell.photo = photo
		
		return photoCell
			
		}

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
	
	func setTheme() {
		guard let themePreference = themeHelper.themePreference else { return }
		view.backgroundColor = themePreference == "Dark" ? .gray : .green
	}
	
	var photoController = PhotoController()
	let themeHelper = ThemeHelper()
	
	// static let collectionView = UICollectionView()
	
}
