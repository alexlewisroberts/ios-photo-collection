//
//  PhotoController.swift
//  ios-photo-collection
//
//  Created by Alex Roberts on 8/2/18.
//  Copyright © 2018 Lambda School Inc. All rights reserved.
//

import Foundation

class PhotoController {
	
	func Create(imageData: Data, title: String) -> Photo {
		let photo = Photo(imageData: imageData, title: title)
		photos.append(photo)
		return photo
	}
	
	func Update(photo: Photo, imageData: Data, title: String) {
		guard let index = photos.index(of: photo) else {return}
		
		var scratch = photo
		scratch.imageData = imageData
		scratch.title = title
		
		photos.remove(at: index)
		photos.insert(scratch, at: index)
	}
	
	var photos: [Photo] = []
	
}
