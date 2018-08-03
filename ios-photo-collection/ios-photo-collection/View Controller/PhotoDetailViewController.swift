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
		imageView.image = UIImage(data:(photo?.imageData)!)
	}
	
	@IBAction func savePhoto(_ sender: Any) {
		let imageData = UIImagePNGRepresentation(imageView.image!)
		if photo != nil {
			photo?.title = textField.text!
			photo?.imageData = imageData!
			_ = navigationController?.popViewController(animated: true)
		} else {
			photo = Photo(imageData: imageData!, title: textField.text!)
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
