//
//  Foundation+Extension.swift
//  RGMapper
//
//  Created by Ritesh Gupta on 02/02/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation

extension String {
	
	init?(optional: TypeConvertible) {
		let convertible = optional
		switch convertible {
		case is String: self.init(convertible.to() as String)
		case is Double: self.init(convertible.to() as Double)
		case is Float: self.init(convertible.to() as Float)
		case is Int: self.init(convertible.to() as Int)
		default: return nil
		}
	}
	
	var bool: Bool? {
		guard let int = Int(optional: self) else { return nil }
		return int.bool
	}
}

extension Double {
	
	init?(optional: Any?) {
		guard let convertible = optional as? TypeConvertible else { return nil }
		switch convertible {
		case is Double: self.init(convertible.to() as Double)
		case is String: self.init(convertible.to() as String)
		case is Float: self.init(convertible.to() as Float)
		case is Int: self.init(convertible.to() as Int)
		default: return nil
		}
	}
}

extension Float {
	
	init?(optional: Any?) {
		guard let convertible = optional as? TypeConvertible else { return nil }
		switch convertible {
		case is Float: self.init(convertible.to() as Float)
		case is String: self.init(convertible.to() as String)
		case is Double: self.init(convertible.to() as Double)
		case is Int: self.init(convertible.to() as Int)
		default: return nil
		}
	}
}

extension Int {
	
	init?(optional: Any?) {
		guard let convertible = optional as? TypeConvertible else { return nil }
		switch convertible {
		case is Int: self.init(convertible.to() as Int)
		case is Int32: self.init(convertible.to() as Int)
		case is Int64: self.init(convertible.to() as Int)
		case is Double: self.init(convertible.to() as Double)
		case is Float: self.init(convertible.to() as Float)
		case is String:
			let string = convertible.to() as String
			if let double = Double(string) {
				self.init(double)
			} else if let float = Float(string) {
				self.init(float)
			} else {
				self.init(string)
			}
		default: return nil
		}
	}
	
	var bool: Bool? {
		guard self > -1, self < 2 else { return nil }
		return self == 1
	}
}

extension Int32 {
	
	init?(optional: Any?) {
		guard let convertible = optional as? TypeConvertible else { return nil }
		switch convertible {
		case is Int: self.init(convertible.to() as Int32)
		case is Int32: self.init(convertible.to() as Int32)
		case is Int64: self.init(convertible.to() as Int32)
		case is Double: self.init(convertible.to() as Double)
		case is Float: self.init(convertible.to() as Float)
		case is String:
			let string = convertible.to() as String
			if let double = Double(string) {
				self.init(double)
			} else if let float = Float(string) {
				self.init(float)
			} else {
				self.init(string)
			}
		default: return nil
		}
	}
	
	var bool: Bool? {
		guard self > -1, self < 2 else { return nil }
		return self == 1
	}
}

extension Int64 {
	
	init?(optional: Any?) {
		guard let convertible = optional as? TypeConvertible else { return nil }
		switch convertible {
		case is Int: self.init(convertible.to() as Int64)
		case is Int32: self.init(convertible.to() as Int64)
		case is Int64: self.init(convertible.to() as Int64)
		case is Double: self.init(convertible.to() as Double)
		case is Float: self.init(convertible.to() as Float)
		case is String:
			let string = convertible.to() as String
			if let double = Double(string) {
				self.init(double)
			} else if let float = Float(string) {
				self.init(float)
			} else {
				self.init(string)
			}
		default: return nil
		}
	}
	
	var bool: Bool? {
		guard self > -1, self < 2 else { return nil }
		return self == 1
	}
}

extension Bool {
	
	init?(optional: Any?) {
		guard let convertible = optional as? TypeConvertible else { return nil }
		switch convertible {
		case is Bool:
			self.init(convertible.to() as Bool)
		case is String:
			guard let bool = (convertible.to() as String).bool else { return nil }
			self.init(bool)
		case is Int:
			guard let bool = (convertible.to() as Int).bool else { return nil }
			self.init(bool)
		default: return nil
		}
	}
}
