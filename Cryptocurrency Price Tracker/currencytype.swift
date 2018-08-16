//
//  currencytype.swift
//  Cryptocurrency Price Tracker
//
//  Created by Mac on 16/08/18.
//  Copyright © 2018 ohmpatel. All rights reserved.
//

import Foundation
import UIKit

import UIKit

enum CurrencyType: String {
	case btc = "BTC",
	eth = "ETH",
	ltc = "LTC",
	xrp = "XRP",
	xmr = "XMR",
	neo = "NEO"
	
	var apiURL: URL? {
		let apiString = "https://min-api.cryptocompare.com/data/price?fsym=" + rawValue + "&tsyms=USD"
		return URL(string: apiString)
	}
	
	var name: String {
		switch self {
		case .btc:
			return "Bitcoin"
		case .eth:
			return "Ethereum"
		case .ltc:
			return "Litecoin"
		case .xrp:
			return "Ripple"
		case .xmr:
			return "Monero"
		case .neo:
			return "NEO"
		}
	}
	
	var image: UIImage {
		switch self {
		case .btc:
			return #imageLiteral(resourceName: "bitcoin")
		case .eth:
			return #imageLiteral(resourceName: "Eth")
		case .ltc:
			return #imageLiteral(resourceName: "litecoin")
		case .xrp:
			return #imageLiteral(resourceName: "ripple")
		case .xmr:
			return #imageLiteral(resourceName: "monero")
		case .neo:
			return #imageLiteral(resourceName: "neo")
		}
	}
	
		func requestValue(completion: @escaping (_ value: NSNumber?) -> Void) {
		guard let apiURL = apiURL else {
			
			completion(nil)
			print("URL Invalid")
			return
		}
		let request = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
			
			guard let data = data, error == nil else {
				completion(nil)
				print(error?.localizedDescription ?? "")
				return
			}
			
			do {
				
				guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
					let value = json["USD"] as? NSNumber else {
						completion(nil)
						return
				}
				completion(value)
			} catch  {
				
				completion(nil)
				print(error.localizedDescription)
			}
		}
		request.resume()
	}
	
}
