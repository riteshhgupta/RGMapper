//
//  Result.swift
//  RGMapper
//
//  Created by Ritesh Gupta on 16/05/18.
//  Copyright © 2018 Ritesh. All rights reserved.
//

import Foundation

enum Result {

	case value(Any)
	case error(MappableError)
}

extension Result {

	var value: Any? {
		if case .value(let value) = self {
			return value
		} else {
			return nil
		}
	}

	var error: MappableError? {
		if case .error(let error) = self {
			return error
		} else {
			return nil
		}
	}
}
