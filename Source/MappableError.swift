//
//  MappableError.swift
//  RGMapper
//
//  Created by Ritesh Gupta on 09/02/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation

public enum MappableError: Error {
	
	case keyNotFound(String, Any?)
	case typeMismatch(String, Any?)
	case unableToParse(Any?)
}

extension MappableError: LocalizedError {
	
	public var errorDescription: String? {
		switch self {
		case .keyNotFound(let expectedKey, let value):
			return "keyNotFound: \"\(expectedKey)\", received: \(value ?? "nil")"
		case .typeMismatch(let expectedType, let value):
			return "typeMismatch –– expected: \"\(expectedType)\", received: \(value ?? "nil")"
		case .unableToParse(let json):
			return "unableToParse: \(json ?? "")"
		}
	}
}
