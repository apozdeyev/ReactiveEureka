import Quick
import Nimble
import UIKit
import Eureka
import ReactiveCocoa
import ReactiveSwift
import Result
@testable import ReactiveEureka
@testable import ReactiveEureka_Example

class RowBindingSpec: QuickSpec {
	var vc: TapsCountVC!
	
    override func spec() {
		beforeEach {
			self.vc = TapsCountVC.load()
		}
		
        describe("Row value binding and actions") {
            it("Text label of taps count row is incremented at selecting button row") {
				let tapsCountRow = self.vc.form.rowBy(tag: TapsCountVC.RowTag.TapsCount) as! TextRow
				let tapsCountCell = tapsCountRow.cell!
				let buttonRow = self.vc.form.rowBy(tag: TapsCountVC.RowTag.Button) as! ButtonRow

				expect(tapsCountRow.value) == "0"
				expect(tapsCountCell.textField.text) == "0"
				
				buttonRow.didSelect()
                expect(tapsCountRow.value) == "1"
				expect(tapsCountCell.textField.text) == "1"
				
				buttonRow.didSelect()
				expect(tapsCountRow.value) == "2"
				expect(tapsCountCell.textField.text) == "2"
            }
        }
    }
}
