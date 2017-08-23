# ReactiveEureka
Reactive extensions to Eureka, based on [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa) and [ReactiveSwift](https://github.com/ReactiveCocoa/ReactiveSwift).

[![CI Status](http://img.shields.io/travis/anatoliy.pozdeyev@gmail.com/ReactiveEureka.svg?style=flat)](https://travis-ci.org/anatoliy.pozdeyev@gmail.com/ReactiveEureka)
[![Version](https://img.shields.io/cocoapods/v/ReactiveEureka.svg?style=flat)](http://cocoapods.org/pods/ReactiveEureka)
[![License](https://img.shields.io/cocoapods/l/ReactiveEureka.svg?style=flat)](http://cocoapods.org/pods/ReactiveEureka)
[![Platform](https://img.shields.io/cocoapods/p/ReactiveEureka.svg?style=flat)](http://cocoapods.org/pods/ReactiveEureka)

## What is Eureka?
[Eureka](https://github.com/xmartlabs/Eureka) is an elegant iOS form builder in declarative style.

## What is ReactiveCocoa and ReactiveSwift?
[ReactiveSwift](https://github.com/ReactiveCocoa/ReactiveSwift) is a cool library for [Functional reactive programming](https://en.wikipedia.org/wiki/Functional_reactive_programming).
And [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa) is a reactive extensions to Cocoa frameworks based on ReactiveSwift.

## What is ReactiveEureka?

ReactiveEureka is a reactive extension for Eureka rows, base building blocks of forms.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* iOS 8.0+
* Xcode 8+
* Swift 3

## Installation

ReactiveEureka is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ReactiveEureka"
```

## Usage

Currently ReactiveEureka provides following reactive primitives:
### Binding
row.reactive.value of type ReactiveSwift.BindingTarget<Row.Value?> allows to bind signal/signal producer/property to row's value. For more details please check [ReactiveSwift documentation](https://github.com/ReactiveCocoa/ReactiveSwift/blob/master/Documentation/FrameworkOverview.md#properties) 

### Action
row.reactive.selected of type CocoaAction allows to hook [ReactiveSwift action](https://github.com/ReactiveCocoa/ReactiveSwift/blob/master/Documentation/ReactivePrimitives.md#action-a-serialized-worker-with-a-preset-action) to row selection event.

**Note:** Currently only single actions is supported.

### Signal
row.reactive.values of type ReactiveSwift.Signal<Row.Value?, NoError>, it is series of row value changing events over time that can be observed. For more details please check [ReactiveSwift documentation](https://github.com/ReactiveCocoa/ReactiveSwift/blob/master/Documentation/FrameworkOverview.md#signals) 
**Note:** Changing events are not emitted when row's value is set via property, i.e. row.value = someValue.

**Note:** Currently only single signal is supported, i.e. requesting second signal stops events emitting by first one.


## Adding reactivity to custom/new row types
All rows that implements core Eureka.RowType protocol, supports Binding.
To add support of Signal and Action it is needed to extend a custom row class by protocols ReactiveEureka.RowChanging and ReactiveEureka.RowSelecting correspondigly.

## License

ReactiveEureka is available under the MIT license. See the LICENSE file for more info.
