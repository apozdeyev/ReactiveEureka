import Quick
import Nimble
import UIKit
import Eureka
import ReactiveCocoa
import ReactiveSwift
import Result
@testable import ReactiveEureka
@testable import ReactiveEureka_Example

class RowActionsSpec: QuickSpec {
	var vc: ViewController!
	
    override func spec() {
		beforeEach {
			let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: ViewController.self))
			self.vc = storyboard.instantiateInitialViewController() as! ViewController
			self.vc.loadViewIfNeeded()
		}
		
		describe("Row actions") {
			it("Row is disabled for time when the cell is just selected and action routine is performed") {
				let buttonRow = self.vc.form.rowBy(tag: ViewController.RowTag.Button) as! ButtonRow
				let action = Action<Void, Void, NoError> {
					return SignalProducer<Void, NoError>( {
						expect(buttonRow.isDisabled) == true
					})
				}
				buttonRow.reactive.selected = CocoaAction(action)

				expect(buttonRow.isDisabled) == false
				buttonRow.didSelect()
				expect(buttonRow.isDisabled) == false
			}
		}
    }
}
