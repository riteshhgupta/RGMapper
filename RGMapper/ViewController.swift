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

	static func map(_ mapper: Mapper) throws -> User {
		return User(
			name: try mapper["human"]["person"]["name"]^^,
			age: try mapper["age"]^^
		)
	}
}

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		let dict: [String: Any] = ["human": ["person": ["name": "Ritesh"]], "age": "25"]
		do {
			let mapper = Mapper(dict)
			let user: User = try mapper^^
			print(user)
		} catch {
			print(error.localizedDescription)
		}
	}
}

