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

public postfix func ^? <T: Mappable>(_ mapper: Mapper) -> T? {
	guard mapper.error == nil, let mapped = try? T.map(mapper) else { return nil }
	return mapped
}

// force unwrap mapper
postfix operator ^!

public postfix func ^! <T: Mappable>(_ mapper: Mapper) -> T {
	return try! T.map(mapper)
}

// parser that throws
postfix operator ^^

public postfix func ^^ <T: Mappable>(_ mapper: Mapper) throws -> T {
	if let error = mapper.error {
		throw error
	} else {
		return try T.map(mapper)
	}
}

postfix operator |^

public postfix func |^ <T: Mappable>(_ mapper: Mapper) throws -> [T] {
	if let error = mapper.error {
		throw error
	} else {
		guard let list = mapper.value as? [Any] else { throw MappableError.unableToParse(mapper.value) }
		return try list.map { try T.map(Mapper($0, context: mapper.context)) }
	}
}

postfix operator |~

public postfix func |~ <T: Mappable>(_ mapper: Mapper) -> [T] {
	guard let list = mapper.value as? [Any] else { return [] }
	return list.compactMap { try? T.map(Mapper($0, context: mapper.context)) }
}

// Operator will set passed value only if it exists, nil won't be set to property
precedencegroup AssignValueIfExists {

	associativity: left
	higherThan: AdditionPrecedence
}

infix operator =? : AssignValueIfExists

public func =? <T> (property: inout T?, newValue: T?) {
	if let value = newValue {
		property = value
	}
}

public func =? <T> (property: inout T, newValue: T?) {
	if let value = newValue {
		property = value
	}
}
