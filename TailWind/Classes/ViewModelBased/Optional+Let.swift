//
//  Optional+Let.swift
//  TailWind
//
//  Created by liu nian on 2021/4/19.
//

import Foundation

extension Optional {
	
	func `let`<T>(_ transform: (Wrapped) -> T?) -> T? {
		if case let .some(value) = self {
			return transform(value)
		}
		return nil
	}
}
