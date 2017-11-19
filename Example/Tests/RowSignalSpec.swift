import Quick
import Nimble
import UIKit
import Eureka
import ReactiveCocoa
import ReactiveSwift
import Result
@testable import ReactiveEureka
@testable import ReactiveEureka_Example

class RowSignalSpec: QuickSpec {
	var vc: TapsCountVC!
	
    override func spec() {
		beforeEach {
			let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: TapsCountVC.self))
			self.vc = storyboard.instantiateInitialViewController() as! TapsCountVC
			self.vc.loadViewIfNeeded()
		}
		
		describe("Row value signal") {
			it("Row value changing events are emitted when the user text in row's cell is chamged") {
				let tapsCountRow = self.vc.form.rowBy(tag: TapsCountVC.RowTag.TapsCount) as! TextRow
				let buttonRow = self.vc.form.rowBy(tag: TapsCountVC.RowTag.Button) as! ButtonRow
				let tapsCount = MutableProperty<Int>(0)
				
				tapsCount <~ tapsCountRow.reactive.values.map { Int($0!)! }
				
				expect(tapsCount.value) == 0
				
				buttonRow.didSelect()
				expect(tapsCount.value) == 1
				
				buttonRow.didSelect()
				expect(tapsCount.value) == 2
			}
			
			it("Signal of row value changing events sends completed event when the row is released") {
				var tapsCountRow:TextRow? = TextRow()
				var counter = 0
				
				tapsCountRow!.reactive.values.observeCompleted {
					counter += 1
				}

				expect(counter) == 0
				tapsCountRow = nil
				expect(counter) == 1
			}
		}
    }
}
