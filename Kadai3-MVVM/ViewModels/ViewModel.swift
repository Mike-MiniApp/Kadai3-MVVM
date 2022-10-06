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
    var number1PublishRelay: PublishRelay <String> { get }
    var number2PublishRelay: PublishRelay <String> { get }
    var calcResultPublishRelay: PublishRelay <String> { get }

}
class ViewModel: ViewModelInputs,ViewModelOutputs {

    // MARK: - Outputs
    var number1PublishRelay = PublishRelay <String> ()
    var number2PublishRelay = PublishRelay <String> ()
    var calcResultPublishRelay = PublishRelay<String>()
    
    // MARK: - Inputs
    var number1TextFieldObservable: Observable<String>
    var number2TextFieldObservable: Observable<String>
    var number1IsOnSwitchObservable: Observable<Bool>
    var number2IsOnSwitchObservable: Observable<Bool>
    var calcButtonTapObservable: Observable<Void>

    // MARK: - property
    private var number1 = 0
    private var number2 = 0
    private var number1IsOnSwitch = false
    private var number2IsOnSwitch = false

    // MARK: - Model Connect
    private let calculator = Calculator()

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
        // switchが切り替わるたびにnumber1の符号を変更する
        number1IsOnSwitchObservable.subscribe { isSwitch in
            self.number1 = -self.number1
            self.number1PublishRelay.accept(String(self.number1))
        }.disposed(by: disposeBag)

        // switchが切り替わるたびにnumber2の符号を変更する
        number2IsOnSwitchObservable.subscribe { isSwitch in
            self.number2 =  -self.number2
            self.number2PublishRelay.accept(String(self.number2))
        }.disposed(by: disposeBag)

        let totalInput = Observable.combineLatest(number1TextFieldObservable, number2TextFieldObservable)

        totalInput.subscribe { number1,number2 in
            self.number1 = Int(number1) ?? 0
            self.number1PublishRelay.accept(String(self.number1))
            self.number2 = Int(number2) ?? 0
            self.number2PublishRelay.accept(String(self.number2))
        }.disposed(by: disposeBag)

        // ボタンをタップした時の処理
        calcButtonTapObservable.subscribe(onNext: {
            self.calculator.addition(number1: self.number1, number2: self.number2)
            self.calcResultPublishRelay.accept(String(self.calculator.calcResultNumber))
        }).disposed(by: disposeBag)
    }
    
}
