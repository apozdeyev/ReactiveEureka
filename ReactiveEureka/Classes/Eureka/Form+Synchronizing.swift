//
//  Form+Synchronizing.swift
//  ReactiveEureka
//
//  Created by Anatoliy Pozdeyev on 19/11/2017.
//

import Eureka

extension Form {
	internal func synchronized<Result>(execute: () throws -> Result) rethrows -> Result {
		objc_sync_enter(self)
		defer { objc_sync_exit(self) }
		return try execute()
	}
}
