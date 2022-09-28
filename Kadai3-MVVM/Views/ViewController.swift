//
//  ViewController.swift
//  Kadai3-MVVM
//
//  Created by 近藤米功 on 2022/09/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var number1Switch: UISwitch!
    @IBOutlet private weak var number2Switch: UISwitch!
    @IBOutlet private weak var calcButton: UIButton!
    @IBOutlet private weak var number1Label: UILabel!
    @IBOutlet private weak var number2Label: UILabel!
    @IBOutlet private weak var calcResultLabel: UILabel!

    private lazy var viewModel = ViewModel(number1TextFieldObservable: number1TextField.rx.text.map{$0 ?? ""}.asObservable(),
                                           number2TextFieldObservable: number2TextField.rx.text.map{$0 ?? ""}.asObservable(),
                                           number1IsOnSwitchObservable: number1Switch.rx.isOn.asObservable(),
                                           number2IsOnSwitchObservable: number2Switch.rx.isOn.asObservable(), calcButtonTapObservable: calcButton.rx.tap.asObservable())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    private func setupBindings() {

    }
}

