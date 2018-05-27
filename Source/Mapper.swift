//
//  Mapper.swift
//  RGMapper
//
//  Created by Ritesh Gupta on 15/05/18.
//  Copyright © 2018 Ritesh. All rights reserved.
//

import Foundation

public struct Mapper {

	let result: Result
	public let context: MapperContext?

	public init(_ value: Any, context mapperContext: MapperContext? = nil) {
		result = .value(value)
		context = mapperContext
	}

	public init(_ error: MappableError, context mapperContext: MapperContext? = nil) {
		result = .error(error)
		context = mapperContext
	}
}

public extension Mapper {

	public subscript(_ key: String) -> Mapper {
		switch result {
		case .value(let value):
			return map(value: value, for: key)
		case .error(let error):
			return Mapper(error, context: context)
		}
	}

	public var value: Any? {
		if case .value(let value) = result {
			return value
		} else {
			return nil
		}
	}

	public var error: MappableError? {
		if case .error(let error) = result {
			return error
		} else {
			return nil
		}
	}
}

extension Mapper {

	func map(value: Any, for key: String) -> Mapper {
		guard let dict = value as? [String: Any] else {
			let error = MappableError.unableToParse(value)
			return Mapper(error, context: context)
		}
		guard let innerValue = dict[key] else {
			let error = MappableError.keyNotFound(key, value)
			return Mapper(error, context: context)
		}
		return Mapper(innerValue, context: context)
	}
}
