//
//  ViewController.swift
//  RGMapper
//
//  Created by Ritesh Gupta on 02/02/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import UIKit

struct User {
	
	let name: String
	let age: Int
}

extension User: Mappable {
	
	static func map(_ value: Any?) throws -> User {
		guard let json = value as? [String: Any] else {
			throw MappableError.unableToParse("root type mismatch")
		}
		return try User(
			name: json["name"]^^,
			age: json["age"]^^
		)
	}
}

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		let dict: [String: Any] = ["name": "Ritesh", "age": "25"]
		do {
			let user: User = try dict^^
			print(user)
		} catch {
			print(error.localizedDescription)
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

