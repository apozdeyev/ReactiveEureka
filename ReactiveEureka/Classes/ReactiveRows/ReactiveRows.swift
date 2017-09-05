//
//  TextRow.swift
//  ReactiveEureka
//
//  Created by Anatoliy Pozdeyev on 17/08/2017.
//

import Eureka


extension TextRow: RowChanging {}
extension NameRow: RowChanging {}
extension URLRow: RowChanging {}
extension IntRow: RowChanging {}
extension PhoneRow: RowChanging {}
extension PasswordRow: RowChanging {}
extension EmailRow: RowChanging {}
extension DecimalRow: RowChanging {}
extension TwitterRow: RowChanging {}
extension AccountRow: RowChanging {}
extension ZipCodeRow: RowChanging {}

extension DateRow: RowChanging {}
extension TimeRow: RowChanging {}
extension DateTimeRow: RowChanging {}
extension CountDownRow: RowChanging {}

extension CheckRow: RowChanging {}
extension SwitchRow: RowChanging {}
extension SliderRow: RowChanging {}
extension StepperRow: RowChanging {}
extension TextAreaRow: RowChanging {}

extension AlertRow: RowSelecting {}
extension ActionSheetRow: RowSelecting {}
extension PushRow: RowSelecting {}
extension MultipleSelectorRow: RowSelecting {}
extension SegmentedRow: RowSelecting {}
extension PickerRow: RowSelecting {}

extension ButtonRowOf: RowSelecting {}
