//
//  Buttons.swift
//  Cal2
//
//  Created by 김종원 on 2020/03/14.
//  Copyright © 2020 김종원. All rights reserved.
//

import Foundation
import SwiftUI

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percent, decimal
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .equals: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "X"
        case .divide: return "÷"
        case .plusMinus: return "±"
        case .percent: return "%"
        case .decimal: return "."
        default: return "AC"
        }
    }
    
    var foreground: Color {
        switch self {
        case .ac, .plusMinus, .percent:
            return Color(.black)
        default:
            return Color(.white)
        }
    }
    
    var background: Color {
        switch self {
        case .divide, .multiply, .minus, .plus, .equals:
            return Color(.orange)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return Color(.darkGray)
        }
    }
    
    var align: Alignment {
        switch self {
        case .zero:
            return Alignment.center
        default:
            return Alignment.center
        }
    }
    
    var fontSize: CGFloat {
        switch self {
        case .divide, .plusMinus:
            return 50
        case .multiply:
            return 32
        default:
            return 40
        }
    }
    
}
