//
//  Mappable.swift
//  RGMapper
//
//  Created by Ritesh Gupta on 02/02/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation

public protocol Mappable {
	
	static func map(_ value: Any?) throws -> Self
}

extension String: Mappable {
	
	public static func map(_ value: Any?) throws -> String {
		guard let convertible = value as? TypeConvertible else { throw MappableError.typeMismatch(value) }
		guard let mapped = String(optional: convertible) else { throw MappableError.typeMismatch(value) }
		return mapped
	}
}

extension Double: Mappable {
	
	public static func map(_ value: Any?) throws -> Double {
		guard let convertible = value as? TypeConvertible else { throw MappableError.typeMismatch(value) }
		guard let mapped = Double(optional: convertible) else { throw MappableError.typeMismatch(value) }
		return mapped
	}
}

extension Bool: Mappable {
	
	public static func map(_ value: Any?) throws -> Bool {
		guard let convertible = value as? TypeConvertible else { throw MappableError.typeMismatch(value) }
		guard let mapped = Bool(optional: convertible) else { throw MappableError.typeMismatch(value) }
		return mapped
	}
}

extension Int: Mappable {
	
	public static func map(_ value: Any?) throws -> Int {
		guard let convertible = value as? TypeConvertible else { throw MappableError.typeMismatch(value) }
		guard let mapped = Int(optional: convertible) else { throw MappableError.typeMismatch(value) }
		return mapped
	}
}

extension Int32: Mappable {
	
	public static func map(_ value: Any?) throws -> Int32 {
		guard let convertible = value as? TypeConvertible else { throw MappableError.typeMismatch(value) }
		guard let mapped = Int32(optional: convertible) else { throw MappableError.typeMismatch(value) }
		return mapped
	}
}

extension Int64: Mappable {
	
	public static func map(_ value: Any?) throws -> Int64 {
		guard let convertible = value as? TypeConvertible else { throw MappableError.typeMismatch(value) }
		guard let mapped = Int64(optional: convertible) else { throw MappableError.typeMismatch(value) }
		return mapped
	}
}

extension Float: Mappable {
	
	public static func map(_ value: Any?) throws -> Float {
		guard let convertible = value as? TypeConvertible else { throw MappableError.typeMismatch(value) }
		guard let mapped = Float(optional: convertible) else { throw MappableError.typeMismatch(value) }
		return mapped
	}
}
