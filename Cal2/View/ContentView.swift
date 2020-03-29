//
//  ContentView.swift
//  Cal2
//
//  Created by 김종원 on 2020/03/11.
//  Copyright © 2020 김종원. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                Spacer()
                HStack {
                    Spacer()
                    Text(env.display)
                        .foregroundColor(.white)
                        .font(.system(size: 80))
                }.padding([.horizontal], 50)
                
                ForEach(buttons, id: \.self) { row in
                    HStack {
                            ForEach(row, id: \.self) { button in
                                CalculatorButtonView(button: button)
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
