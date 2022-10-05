//
//  ViewController.swift
//  Kadai3-MVVM
//
//  Created by 近藤米功 on 2022/09/29.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class ViewController: UIViewController {
    // MARK: - UI Patrs
    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var number1Switch: UISwitch!
    @IBOutlet private weak var number2Switch: UISwitch!
    @IBOutlet private weak var calcButton: UIButton!
    @IBOutlet private weak var number1Label: UILabel!
    @IBOutlet private weak var number2Label: UILabel!
    @IBOutlet private weak var calcResultLabel: UILabel!

    private lazy var viewModel = ViewModel(number1TextFieldObservable: number1TextField.rx.text.map{$0 ?? ""}.asObservable(), number2TextFieldObservable: number2TextField.rx.text.map{$0 ?? ""}.asObservable(), number1IsOnSwitchObservable: number1Switch.rx.isOn.asObservable(), number2IsOnSwitchObservable: number2Switch.rx.isOn.asObservable(), calcButtonTapObservable: calcButton.rx.tap.asObservable())

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    private func setupBindings() {
        viewModel.calcResultPublishRelay.bind(to: calcResultLabel.rx.text).disposed(by: disposeBag)
        viewModel.number1PublishRelay.bind(to: number1Label.rx.text).disposed(by: disposeBag)
        viewModel.number2PublishRelay.bind(to: number2Label.rx.text).disposed(by: disposeBag)
    }
}

