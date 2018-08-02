//
//  ThemeHelper.swift
//  ios-photo-collection
//
//  Created by Alex Roberts on 8/2/18.
//  Copyright © 2018 Lambda School Inc. All rights reserved.
//

import Foundation

class ThemeHelper {
	let themePreferenceKey = "abcwearefree"
	let userdefaults = UserDefaults.standard

	func setThemePreferenceToDark() {
		userdefaults.set("Dark", forKey: themePreferenceKey)
	}
	
	func setThemePreferenceToGreen() {
		userdefaults.set("Green", forKey: themePreferenceKey)
	}
	
	init () {
		if themePreference == nil {
			setThemePreferenceToGreen()
		}
	}
	
	let themePreference: String? = UserDefaults.standard.string(forKey: "abcwearefree")
	
}
