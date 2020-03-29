//
//  Calculator.swift
//  Cal2
//
//  Created by 김종원 on 2020/03/14.
//  Copyright © 2020 김종원. All rights reserved.
//

import SwiftUI
import Foundation

class GlobalEnvironment: ObservableObject {
    @Published var display = "0"
    @Published var memory: Float = 0
    @Published var sign = ""
    @Published var number: Float! = 0
    @Published var solution: Float! = 0
    @Published var decimalFlag = false
    @Published var equalFlag = false
    @Published var decimalCounter: Float = 1
    func receiveInput(calculatorButton: CalculatorButton) {
        switch calculatorButton {
        case .ac:
            self.solution = 0
            self.display = "0"
            self.memory = 0
            self.sign = ""
            initiateCal()
        case .plus, .minus, .multiply, .divide:
            if equalFlag {
                self.number = self.solution
                self.display = String(self.number)
            } else if self.sign != "" {
                processEqual()
                self.display = String(self.solution)
            } else {
                self.display = String(self.number)
            }
            self.sign = calculatorButton.title
            self.memory = self.number
            initiateCal()
        case .equals:
            processEqual()
            self.decimalFlag = false
            self.decimalCounter = 1
        case .decimal:
            self.decimalFlag = true
            self.equalFlag = false
        case .percent:
            self.number /= 100
            self.display = String(self.number)
        case .plusMinus:
            self.number = -1 * self.number
            self.display = String(self.number)
        default:
            self.number = calculateDecimal(calculatorButton: calculatorButton)
            self.display = String(self.number)
            self.equalFlag = false
        }
    }
    
    func initiateCal() {
        self.number = 0
        self.decimalFlag = false
        self.equalFlag = false
        self.decimalCounter = 1
    }

    func calculateDecimal(calculatorButton: CalculatorButton) -> Float! {
        if self.decimalFlag {
            self.decimalCounter /= 10
            return self.number + Float(calculatorButton.title)! * self.decimalCounter
        } else {
            return self.number * 10 + Float(calculatorButton.title)!
        }
    }

    func processSigns() -> Float! {
        switch self.sign {
        case "+":
            return self.memory + self.number
        case "-":
            return self.memory - self.number
        case "X":
            return self.memory * self.number
        case "÷":
            if self.number == 0 {
                return nil
            }
            return self.memory / self.number
        default:
            return self.number * 1
        }
    }
    
    func processEqual() {
        if !self.equalFlag {
            self.equalFlag = true
        }
        self.solution = processSigns()
        self.display = String(self.solution)
        self.memory = Float(self.display)!
    }
}
