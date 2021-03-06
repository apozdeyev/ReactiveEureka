//
//  Form+BindingTarget.swift
//  ReactiveEureka
//
//  Created by Anatoliy Pozdeyev on 19/11/2017.
//

import Foundation
import ReactiveSwift
import Eureka

extension Reactive where Base: Form {
	/// Creates a binding target which uses the lifetime of the object, and
	/// weakly references the object so that the supplied `action` is triggered
	/// only if the object has not deinitialized.
	///
	/// - parameters:
	///   - scheduler: An optional scheduler that the binding target uses. If it
	///                is not specified, a UI scheduler would be used.
	///   - action: The action to consume values from the bindings.
	///
	/// - returns: A binding target that holds no strong references to the
	///            object.
	public func makeBindingTarget<U>(on scheduler: Scheduler = UIScheduler(), _ action: @escaping (Base, U) -> Void) -> BindingTarget<U> {
		return BindingTarget(on: scheduler, lifetime: lifetime) { [weak base = self.base] value in
			if let base = base {
				action(base, value)
			}
		}
	}
}

