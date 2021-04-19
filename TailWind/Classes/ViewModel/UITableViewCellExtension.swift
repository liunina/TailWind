//
//  UITableViewCellExtension.swift
//  TailWind
//
//  Created by liu nian on 2021/4/19.
//

import Foundation
import UIKit

extension UITableView {
	// MARK: Public functions

	func registerClass<T: UITableViewCell>(_ cellType: T.Type, reuseIdentifier: String = T.reuseIdentifier) {
		register(cellType, forCellReuseIdentifier: reuseIdentifier)
	}

	func dequeueReusableCellClass<T: UITableViewCell>(for indexPath: IndexPath, type _: T.Type? = nil, reuseIdentifier: String = T.reuseIdentifier) -> T {
		(dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T)!
	}
}

extension UITableViewCell {
	static var reuseIdentifier: String {
		String(describing: self)
	}
}
