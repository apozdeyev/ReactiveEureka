//
//  RowSelecting.swift
//  Pods
//
//  Created by Anatoliy Pozdeyev on 19/08/2017.
//
//

import ReactiveSwift
import ReactiveCocoa
import enum Result.NoError
import Eureka


public protocol RowSelecting: RowType {
	associatedtype Cell: TypedCellType

	@discardableResult
	func onCellSelection(_ callback: @escaping ((_ cell: Cell, _ row: Self) -> Void)) -> Self
	
	var disabled: Condition? { get set }
	func evaluateDisabled()
}


extension Reactive where Base: RowSelecting {
	/// The action to be triggered when the row is selected.
	public var selected: CocoaAction<Base>? {
		get {
			return associatedAction.value?.action
		}
		
		nonmutating set {
			setAction(newValue)
		}
	}
	
	
	/// The current associated action of `self`, with its disposable.
	internal var associatedAction: Atomic<(action: CocoaAction<Base>, disposable: Disposable)?> {
		return associatedValue { _ in Atomic(nil) }
	}
	
	/// Set the associated action of `self` to `action`, and register it for the
	/// selecting event.
	///
	/// - parameters:
	///   - action: The action to be associated.
	///	  - disposable: An outside disposable that will be bound to the scope of
	///					the given `action`.
	internal func setAction(_ action: CocoaAction<Base>?, disposable: Disposable? = nil) {
		associatedAction.modify { associatedAction in
			associatedAction?.disposable.dispose()
			
			if let action = action {
				base.onCellSelection( { (cell, row) in
					action.execute(row)
				})
				
				let compositeDisposable = CompositeDisposable()
				compositeDisposable += isEnabled <~ action.isEnabled
				compositeDisposable += { [weak base = self.base] in
					base?.onCellSelection({ (cell, row) in })
				}
				compositeDisposable += disposable
				
				associatedAction = (action, ScopedDisposable(compositeDisposable))
			} else {
				associatedAction = nil
			}
		}
	}
	
	/// Sets whether the control is enabled.
	public var isEnabled: BindingTarget<Bool> {
		return makeBindingTarget {
			$0.disabled = Condition(booleanLiteral: !$1)
			$0.evaluateDisabled()
		}
	}
}
