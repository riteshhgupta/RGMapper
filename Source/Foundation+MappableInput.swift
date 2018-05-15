//
//  Foundation+Extension.swift
//  RGMapper
//
//  Created by Ritesh Gupta on 02/02/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation

extension String: MappableInput {
	
	public init?(input: MappableInput) {
		switch input {
		case is String: self.init(input.to() as String)
		case is Double: self.init(input.to() as Double)
		case is Float: self.init(input.to() as Float)
		case is Int64: self.init(input.to() as Int64)
		case is Int32: self.init(input.to() as Int32)
		case is Int: self.init(input.to() as Int)
		default: return nil
		}
	}
	
	var bool: Bool? {
		guard let int = Int(input: self) else { return nil }
		return int.bool
	}
}

extension Double: MappableInput {
	
	public init?(input: MappableInput) {
		switch input {
		case is Double: self.init(input.to() as Double)
		case is String: self.init(input.to() as String)
		case is Float: self.init(input.to() as Float)
		case is Int64: self.init(input.to() as Int64)
		case is Int32: self.init(input.to() as Int32)
		case is Int: self.init(input.to() as Int)
		default: return nil
		}
	}
}

extension Float: MappableInput {
	
	public init?(input: MappableInput) {
		switch input {
		case is Float: self.init(input.to() as Float)
		case is String: self.init(input.to() as String)
		case is Double: self.init(input.to() as Double)
		case is Int64: self.init(input.to() as Int64)
		case is Int32: self.init(input.to() as Int32)
		case is Int: self.init(input.to() as Int)
		default: return nil
		}
	}
}

extension Int: MappableInput {
	
	public init?(input: MappableInput) {
		switch input {
		case is Int: self.init(input.to() as Int)
		case is Int32: self.init(input.to() as Int32)
		case is Int64: self.init(input.to() as Int64)
		case is Double: self.init(input.to() as Double)
		case is Float: self.init(input.to() as Float)
		case is String:
			let string = input.to() as String
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

extension Int32: MappableInput {
	
	public init?(input: MappableInput) {
		switch input {
		case is Int: self.init(input.to() as Int)
		case is Int32: self.init(input.to() as Int32)
		case is Int64: self.init(input.to() as Int64)
		case is Double: self.init(input.to() as Double)
		case is Float: self.init(input.to() as Float)
		case is String:
			let string = input.to() as String
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

extension Int64: MappableInput {
	
	public init?(input: MappableInput) {
		switch input {
		case is Int: self.init(input.to() as Int)
		case is Int32: self.init(input.to() as Int32)
		case is Int64: self.init(input.to() as Int64)
		case is Double: self.init(input.to() as Double)
		case is Float: self.init(input.to() as Float)
		case is String:
			let string = input.to() as String
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

extension Bool: MappableInput {

	public init?(input: MappableInput) {
		switch input {
		case is Bool:
			self.init(input.to() as Bool)
		case is String:
			guard let bool = (input.to() as String).bool else { return nil }
			self.init(bool)
		case is Int:
			guard let bool = (input.to() as Int).bool else { return nil }
			self.init(bool)
		case is Int32:
			guard let bool = (input.to() as Int32).bool else { return nil }
			self.init(bool)
		case is Int64:
			guard let bool = (input.to() as Int64).bool else { return nil }
			self.init(bool)
		default: return nil
		}
	}
}

extension NSString: MappableInput {}

extension NSNumber : MappableInput {}
