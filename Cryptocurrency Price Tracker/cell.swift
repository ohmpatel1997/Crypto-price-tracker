//
//  tabelcell.swift
//  Cryptocurrency Price Tracker
//
//  Created by Mac on 16/08/18.
//  Copyright © 2018 ohmpatel. All rights reserved.
//

import Foundation
import UIKit

class cell:UITableViewCell{
	
	@IBOutlet weak var imageview: UIImageView!
	@IBOutlet weak var price: UILabel!
	@IBOutlet weak var cryptoname: UILabel!
	
	@IBOutlet weak var loader: UIActivityIndicatorView!
	func formatCell(withCurrencyType currencyType: CurrencyType) {
		cryptoname.text = currencyType.name
		imageview.image = currencyType.image
		
		currencyType.requestValue { (value) in
			DispatchQueue.main.async {
				self.price.text = value?.formattedCurrencyString ?? "No Internet Connection"
				self.loader.stopAnimating()
				self.loader.isHidden = true
				self.price.isHidden = false
			}
		}
	}
	
}
	private extension NSNumber {
		
			var formattedCurrencyString: String? {
			let formatter = NumberFormatter()
			formatter.locale = Locale(identifier: "en_US")
			formatter.numberStyle = .currency
			return formatter.string(from: self)
		}

}
