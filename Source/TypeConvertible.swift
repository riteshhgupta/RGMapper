//
//  TypeConvertible.swift
//  RGMapper
//
//  Created by Ritesh Gupta on 02/02/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation

protocol TypeConvertible {
	
	func to<T>() -> T
	func maybe<T>() -> T?
}

extension TypeConvertible {
	
	func to<T>() -> T { return self as! T }
	func maybe<T>() -> T? { return self as? T }
}

extension String: TypeConvertible {}

extension Int: TypeConvertible {}

extension Int32: TypeConvertible {}

extension Int64: TypeConvertible {}

extension Float: TypeConvertible {}

extension Double: TypeConvertible {}

extension Bool: TypeConvertible {}

extension NSString: TypeConvertible {}

extension NSNumber : TypeConvertible {}
