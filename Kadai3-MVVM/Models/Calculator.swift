//
//  Calculator.swift
//  Kadai3-MVVM
//
//  Created by 近藤米功 on 2022/09/29.
//

import Foundation

class Calculator {
    private (set) var calcResultNumber = 0

    func addition(number1: Int,number2: Int) {
        calcResultNumber = number1 + number2
    }
}
