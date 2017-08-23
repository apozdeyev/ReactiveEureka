//
//  RowType.swift
//  ReactiveEureka
//
//  Created by Anatoliy Pozdeyev on 17/08/2017.
//  Copyright © 2017 VitaSw. All rights reserved.
//

import ReactiveSwift
import enum Result.NoError
import Eureka


extension Reactive where Base: RowType {
	public var value: BindingTarget<Base.Cell.Value?> {
		return makeBindingTarget {
			$0.value = $1
			$0.updateCell()
		}
	}
}
