import Eureka

extension BaseRowType {
	internal func synchronized<Result>(execute: () throws -> Result) rethrows -> Result {
		objc_sync_enter(self)
		defer { objc_sync_exit(self) }
		return try execute()
	}
}
