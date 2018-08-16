//
//  ViewController.swift
//  Cryptocurrency Price Tracker
//
//  Created by Mac on 16/08/18.
//  Copyright © 2018 ohmpatel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

	@IBAction func refreshprice(_ sender: Any) {
		self.tableview.reloadData()
	}
	@IBOutlet weak var tableview: UITableView!
	let cryptos:[CurrencyType] = [.btc,.eth,.ltc,.xrp,.xmr,.neo]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
			tableview.dataSource = self
		tableview.delegate = self
		self.tableview.allowsSelection = false
		
		self.navigationController?.navigationBar.tintColor = UIColor.gray
		self.navigationItem.rightBarButtonItem?.tintColor = UIColor.blue
		self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.red]
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cryptos.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cell
		cell.price.isHidden = true
		cell.loader.isHidden = false
		cell.loader.startAnimating()
		let Cointype = cryptos[indexPath.row]
		cell.formatCell(withCurrencyType: Cointype)
		return cell
	}
	 
	
}


