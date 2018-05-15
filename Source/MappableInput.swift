//
//  TypeConvertible.swift
//  RGMapper
//
//  Created by Ritesh Gupta on 02/02/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation

public protocol MappableInput {
	
	init?(input: MappableInput)
}

public extension MappableInput {
	
	func to<T>() -> T { return self as! T }
	func maybe<T>() -> T? { return self as? T }

	init?(input: MappableInput) { return nil }
}
