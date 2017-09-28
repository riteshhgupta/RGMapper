//
//  MappableError.swift
//  RGMapper
//
//  Created by Ritesh Gupta on 09/02/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation

public enum MappableError: Error {
	
	case keyNotFound(Any?)
	case typeMismatch(Any?)
	case unableToParse(Any?)
	
	public var input: Any? {
		switch self {
		case .keyNotFound(let value): return value
		case .typeMismatch(let value): return value
		case .unableToParse(let value): return value
		}
	}
}

extension MappableError: LocalizedError {
	
	public var errorDescription: String? {
		switch self {
		case .keyNotFound(let json): return "keyNotFound for \(json ?? "")"
		case .typeMismatch(let json): return "typeMismatch for \(json ?? "")"
		case .unableToParse(let json): return "unableToParse for \(json ?? "")"
		}
	}
}
