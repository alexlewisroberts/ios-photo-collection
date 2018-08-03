//
//  PhotoDetailViewController.swift
//  ios-photo-collection
//
//  Created by Alex Roberts on 8/2/18.
//  Copyright © 2018 Lambda School Inc. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
		updateViews()
}

	func setTheme() {
		guard let themePreference = themeHelper!.themePreference else { return }
		view.backgroundColor = themePreference == "Dark" ? .gray : .green
	}
	
	private func updateViews() {
		textField.text = photo?.title
		guard let imageData = photo?.imageData else { return }
		imageView.image = UIImage(data: imageData)
	}
	
	@IBAction func savePhoto(_ sender: Any) {
		guard let image = imageView.image else { return }
		let imageData = UIImagePNGRepresentation(image)
		let title = textField.text
		if photo != nil {
			photoController?.Update(photo: photo!, imageData: imageData!, title: title!)
			_ = navigationController?.popViewController(animated: true)
		} else {
			_ = photoController?.Create(imageData: imageData!, title: title!)
			_ = navigationController?.popViewController(animated: true)
		}
	}
	@IBAction func addPhoto(_ sender: Any) {
		PHPhotoLibrary.requestAuthorization { (status) in
			guard status == .authorized else {
				NSLog("Please go into the settings and allow access to photos for SimplePhoto.")
				return
			}
			
			DispatchQueue.main.async {
				self.presentImagePickerController()
			}
		}
	}
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var textField: UITextField!
	
	func presentImagePickerController() {
		let imagePicker = UIImagePickerController()
		imagePicker.sourceType = .photoLibrary
		imagePicker.delegate = self
		present(imagePicker, animated: true, completion: nil)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		
		picker.dismiss(animated: true, completion: nil)
		
		guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
		imageView.image = image
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		picker.dismiss(animated: true, completion: nil)
	}
	
	
	// MARK: - Properties
	
	var photoController: PhotoController?
	var photo: Photo?
	var themeHelper: ThemeHelper?

}
