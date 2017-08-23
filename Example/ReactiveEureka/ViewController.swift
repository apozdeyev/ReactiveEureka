//
//  ViewController.swift
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

class ViewController: FormViewController {
	
	fileprivate let tapsCount = MutableProperty<Int>(0)
	fileprivate let lastTapDate = MutableProperty<Date?>(nil)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		createForm()
	}

	fileprivate func createForm() {
		form +++ Section("Info")
			<<< TextRow() {
				$0.title = "Taps Count"
				$0.reactive.value <~ self.tapsCount.map { String($0) }
			}
			<<< TimeRow() {
				$0.title = "Last tap"
				$0.dateFormatter?.timeStyle = .long
				$0.reactive.value <~ self.lastTapDate
			}
			+++ Section("Actions")
			<<< ButtonRow(){
				$0.title = "Tap"
				$0.reactive.selected = CocoaAction(self.buttonaTapAction())
		}
	}
	
	
	fileprivate func buttonaTapAction() -> Action<Void, Void, NoError> {
		return Action<Void, Void, NoError> {
			return SignalProducer<Void, NoError>( { [weak self] in
				self?.modifyModel()
			})
		}
	}
	
	fileprivate func modifyModel() {
		tapsCount.value += 1
		lastTapDate.value = Date()
	}
	
}

