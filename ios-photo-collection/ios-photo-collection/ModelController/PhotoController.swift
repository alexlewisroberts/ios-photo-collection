//
//  PhotoController.swift
//  ios-photo-collection
//
//  Created by Alex Roberts on 8/2/18.
//  Copyright © 2018 Lambda School Inc. All rights reserved.
//

import Foundation

class PhotoController {
	
	func Create(photo: Photo) {
		photos.append(photo)
	}
	
	func Update(photo: Photo, data: Data, string: String) {
	}
	
	var photos: [Photo] = []
	
}
