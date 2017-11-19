//
//  Form+Association.swift
//  ReactiveEureka
//
//  Created by Anatoliy Pozdeyev on 19/11/2017.
//

import ReactiveSwift
import Eureka

extension Reactive where Base: Form {
	/// Retrieve the associated value for the specified key. If the value does not
	/// exist, `initial` would be called and the returned value would be
	/// associated subsequently.
	///
	/// - parameters:
	///   - key: An optional key to differentiate different values.
	///   - initial: The action that supples an initial value.
	///
	/// - returns: The associated value for the specified key.
	internal func associatedValue<T>(forKey key: StaticString = #function, initial: (Base) -> T) -> T {
		let key = AssociationKey<T?>(key)
		
		if let value = base.associations.value(forKey: key) {
			return value
		}
		
		let value = initial(base)
		base.associations.setValue(value, forKey: key)
		
		return value
	}
}

extension Form {
	@nonobjc internal var associations: Associations<Form> {
		return Associations(self)
	}
}
