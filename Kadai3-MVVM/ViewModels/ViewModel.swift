//
//  ViewModel.swift
//  Kadai3-MVVM
//
//  Created by 近藤米功 on 2022/09/29.
//

import RxSwift
import RxCocoa

// MARK: Inputs
protocol ViewModelInputs {
    var number1TextFieldObservable: Observable <String> { get }
    var number2TextFieldObservable: Observable <String> { get }
    var number1IsOnSwitchObservable: Observable <Bool> { get }
    var number2IsOnSwitchObservable: Observable <Bool> { get }
    var calcButtonTapObservable: Observable <Void> { get }
}

// MARK: Outputs
protocol ViewModelOutputs {

}
class ViewModel: ViewModelInputs {

    var number1TextFieldObservable: Observable<String>
    var number2TextFieldObservable: Observable<String>
    var number1IsOnSwitchObservable: Observable<Bool>
    var number2IsOnSwitchObservable: Observable<Bool>
    var calcButtonTapObservable: Observable<Void>

    init(number1TextFieldObservable: Observable<String>,
         number2TextFieldObservable: Observable<String>,
         number1IsOnSwitchObservable: Observable<Bool>,
         number2IsOnSwitchObservable: Observable<Bool>,
         calcButtonTapObservable: Observable<Void>) {
        self.number1TextFieldObservable = number1TextFieldObservable
        self.number2TextFieldObservable = number2TextFieldObservable
        self.number1IsOnSwitchObservable = number1IsOnSwitchObservable
        self.number2IsOnSwitchObservable = number2IsOnSwitchObservable
        self.calcButtonTapObservable = calcButtonTapObservable

        setupBindings()
    }

    private func setupBindings() {

    }
    
}
