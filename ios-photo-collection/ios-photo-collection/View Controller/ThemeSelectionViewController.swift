//
//  ThemeSelectionViewController.swift
//  ios-photo-collection
//
//  Created by Alex Roberts on 8/2/18.
//  Copyright © 2018 Lambda School Inc. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func selectDarkTheme(_ sender: Any) {
		themeHelper?.setThemePreferenceToDark()
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func selectGreenTheme(_ sender: Any) {
		themeHelper?.setThemePreferenceToGreen()
		dismiss(animated: true, completion: nil)
	}
	
	var themeHelper: ThemeHelper?
	
}
