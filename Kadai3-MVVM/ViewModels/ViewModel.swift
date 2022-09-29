//
//  ViewModel.swift
//  Kadai3-MVVM
//
//  Created by 近藤米功 on 2022/09/29.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

// MARK: - Inputs
protocol ViewModelInputs {
    var number1TextFieldObservable: Observable <String> { get }
    var number2TextFieldObservable: Observable <String> { get }
    var number1IsOnSwitchObservable: Observable <Bool> { get }
    var number2IsOnSwitchObservable: Observable <Bool> { get }
    var calcButtonTapObservable: Observable <Void> { get }
}

// MARK: - Outputs
protocol ViewModelOutputs {
    var calcResultPublishSubject: PublishSubject <String> { get }

}
class ViewModel: ViewModelInputs,ViewModelOutputs {

    // MARK: - Outputs
    var calcResultPublishSubject = PublishSubject<String>()
    
    // MARK: - Inputs
    var number1TextFieldObservable: Observable<String>
    var number2TextFieldObservable: Observable<String>
    var number1IsOnSwitchObservable: Observable<Bool>
    var number2IsOnSwitchObservable: Observable<Bool>
    var calcButtonTapObservable: Observable<Void>

    // MARK: - property
    private var number1 = ""
    private var number2 = ""
    private var number1IsOnSwitch = false
    private var number2IsOnSwitch = false

    private let disposeBag = DisposeBag()

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
        number1TextFieldObservable.subscribe(onNext: { text in
            self.number1 = text
            print(self.number1)
        })
        .disposed(by: disposeBag)

        number2IsOnSwitchObservable.subscribe { isSwitchOn in
            print(isSwitchOn)
        }
        .disposed(by: disposeBag)
    }
    
}
