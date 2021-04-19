//
//  NibBased.swift
//  TailWind
//
//  Created by liu nian on 2021/4/19.
//

import Foundation
import UIKit

public protocol NibBased {
	// MARK: Static parameters
	
	static var nibName: String { get }
}

public extension NibBased {
	// MARK: Static parameters
	
	static var nibName: String {
		String(describing: self)
	}
}

public extension NibBased where Self: UIView {
	// MARK: Static functions
	
	static func instantiate(owner: Any? = nil) -> Self {
		let nib = UINib(nibName: nibName, bundle: nil)
		let items = nib.instantiate(withOwner: owner, options: nil)
		return (items.first! as? Self)!
	}
}

public extension NibBased where Self: UIViewController {
	// MARK: Static functions
	
	static func instantiate() -> Self {
		Self(nibName: nibName, bundle: Bundle(for: self))
	}
}

public extension NibBased where Self: UITableViewController {
	// MARK: Static functions
	
	static func instantiate() -> Self {
		Self(nibName: nibName, bundle: Bundle(for: self))
	}
}

public extension NibBased where Self: UICollectionViewCell {
	// MARK: Static properties
	
	static var nib: UINib {
		UINib(nibName: String(describing: self), bundle: nil)
	}
}

public extension NibBased where Self: UITableViewCell {
	// MARK: Static properties
	
	static var nib: UINib {
		UINib(nibName: String(describing: self), bundle: nil)
	}
}

public extension UICollectionView {
	// MARK: Public functions
	
	func register<T: UICollectionViewCell & NibBased>(_ cellType: T.Type, nibName: String? = nil) {
		let nib = nibName.let { UINib(nibName: $0, bundle: nil) } ?? T.nib
		register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
	}
	
	func register<T: UICollectionViewCell>(_: T.Type) {
		register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
	}
	
	func dequeueReusableCell<T: UICollectionViewCell & NibBased>(for indexPath: IndexPath) -> T {
		(dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T)!
	}
	
	func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
		(dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T)!
	}
}

public extension UITableView {
	// MARK: Public functions
	
	func register<T: UITableViewCell & NibBased>(_: T.Type, nibName: String? = nil) {
		let nib = nibName.let { UINib(nibName: $0, bundle: nil) } ?? T.nib
		register(nib, forCellReuseIdentifier: T.reuseIdentifier)
	}
	
	func register<T: UITableViewCell>(_: T.Type) {
		register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
	}
	
	func dequeueReusableCell<T: UITableViewCell & NibBased>(for indexPath: IndexPath) -> T {
		(dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T)!
	}
	
	func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
		(dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T)!
	}
}
