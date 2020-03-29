//
//  CalculatorButtonView.swift
//  Cal2
//
//  Created by 김종원 on 2020/03/14.
//  Copyright © 2020 김종원. All rights reserved.
//

import SwiftUI

struct CalculatorButtonView: View {
    var button: CalculatorButton
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        Button(action: {
            self.env.receiveInput(calculatorButton: self.button)
        }) {
        Text(button.title)
            .font(.system(size: button.fontSize))
            .frame(width: self.buttonWidth(button: button), height: self.buttonHeight(button: button), alignment: button.align)
            .foregroundColor(button.foreground)
            .background(button.background)
            .cornerRadius(self.buttonHeight(button: button))
        }
    }
    
    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
        }
        
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    private func buttonHeight(button: CalculatorButton) -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}


struct CalculatorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonView(button: CalculatorButton.one)
    }
}
