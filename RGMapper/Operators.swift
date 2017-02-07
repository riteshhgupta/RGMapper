//
//  Operators.swift
//  RGMapper
//
//  Created by Ritesh Gupta on 02/02/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation

// optional mapper
postfix operator ^?

public postfix func ^? <T: Mappable>(_ value: Any?) -> T? {
	guard let mapped = try? T.map(value) else { return nil }
	return mapped
}

// force unwrap mapper
postfix operator ^!

public postfix func ^! <T: Mappable>(_ value: Any?) -> T {
	return try! T.map(value)
}

// default value mapper
postfix operator ^~

public postfix func ^~ <T: Mappable & Defaultable>(_ value: Any?) -> T {
	guard let mapped: T = value^? else { return T.default }
	return mapped
}

// parser that throws
postfix operator ^^

public postfix func ^^ <T: Mappable>(_ value: Any?) throws -> T {
	return try T.map(value)
}

// parser that throws
postfix operator <<

public postfix func << <T>(_ value: Any?) throws -> T {
	guard let typed = value as? T else { throw MappableError.unableToParse(value) }
	return typed
}

postfix operator |^

public postfix func |^ <T: Mappable>(_ value: Any?) throws -> [T] {
	guard let list = value as? [[String: Mappable]] else { throw MappableError.unableToParse(value) }
	return try list.map { try T.map($0) }
}

postfix operator |~

public postfix func |~ <T: Mappable>(_ value: Any?) -> [T] {
	guard let list = value as? [[String: Mappable]] else { return [] }
	return list.flatMap { try? T.map($0) }
}

