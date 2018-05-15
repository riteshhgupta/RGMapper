//
//  Mappable.swift
//  RGMapper
//
//  Created by Ritesh Gupta on 02/02/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation

public protocol Mappable {
	
	static func map(_ mapper: Mapper) throws -> Self
}

extension Mappable where Self: MappableInput {

	public static func map(_ mapper: Mapper) throws -> Self {
		if let error = mapper.error {
			throw error
		} else {
			guard
				let input = mapper.value as? MappableInput,
				let mappedValue = Self(input: input)
				else { throw MappableError.typeMismatch(String(describing: self), mapper.value) }
			return mappedValue
		}
	}
}
