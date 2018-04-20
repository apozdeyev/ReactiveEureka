//
//  FormBindingVC.swift
//  ReactiveEureka
//
//  Created by anatoliy.pozdeyev@gmail.com on 08/18/2017.
//  Copyright (c) 2017 anatoliy.pozdeyev@gmail.com. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Eureka
import ReactiveEureka
import Result

class FormBindingVC: FormViewController {
	fileprivate let rows = MutableProperty<[BaseRow]>([])
	
	override func viewDidLoad() {
		super.viewDidLoad()

		bindRowsToForm()
		createRows()
	}
	
	fileprivate func bindRowsToForm() {
		form.reactive.value <~ rows
	}
	
	
	fileprivate func createRows() {
		rows.value = [
			TextRow() { $0.title = "Row1" }
			, TextRow() { $0.title = "Row2" }
			, TextRow() { $0.title = "Row3" }
		]
	}
}

