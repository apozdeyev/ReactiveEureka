//
//  BaseReactiveRow.swift
//  EurekaPrototype
//
//  Created by Anatoliy Pozdeyev on 13/08/2017.
//

import ReactiveSwift
import enum Result.NoError
import Eureka


public protocol RowChanging: BaseRowType {
	associatedtype Cell: TypedCellType
	@discardableResult
	func onChange(_ callback: @escaping (Self) -> Void) -> Self
	
	var value: Cell.Value? { get }
}



extension Reactive where Base: RowChanging {
	public var values: Signal<Base.Cell.Value?, NoError> {
		return Signal { observer in
			base.onChange({ row in
				observer.send(value: row.value)
			})

			let disposable = lifetime.ended.observeCompleted(observer.sendCompleted)

			return AnyDisposable {
				disposable?.dispose()
			}
		}
	}
}
