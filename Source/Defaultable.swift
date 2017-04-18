//
//  Defaultable.swift
//  RGMapper
//
//  Created by Ritesh Gupta on 02/02/17.
//  Copyright © 2017 Ritesh. All rights reserved.
//

import Foundation

public protocol Defaultable {
	
	static var `default`: Self { get }
}
