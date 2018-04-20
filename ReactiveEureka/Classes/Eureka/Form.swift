//
//  Form.swift
//  ReactiveEureka
//
//  Created by Anatoliy Pozdeyev on 19/11/2017.
//


import ReactiveSwift
import enum Result.NoError
import Eureka


extension Reactive where Base: Form {
	public var value: BindingTarget<[BaseRow]> {
		return makeBindingTarget {
			$0.removeAll(keepingCapacity: false)
			
			let section = Section("")
			$0 +++ section
			
			for row in $1 {
				section <<< row
			}
		}
	}
}

