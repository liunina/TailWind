//
//  UICollectionViewCellExtension.swift
//  TailWind
//
//  Created by liu nian on 2021/4/19.
//

import Foundation
import UIKit

extension UICollectionView {
	// MARK: Public functions

	func registerClass<T: UICollectionViewCell>(_ cellType: T.Type, reuseIdentifier: String = T.reuseIdentifier) {
		register(cellType, forCellWithReuseIdentifier: reuseIdentifier)
	}

	func dequeueReusableCellClass<T: UICollectionViewCell>(for indexPath: IndexPath, type _: T.Type? = nil, reuseIdentifier: String = T.reuseIdentifier) -> T {
		(dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? T)!
	}
}

extension UICollectionViewCell {
	static var reuseIdentifier: String {
		String(describing: self)
	}
}
