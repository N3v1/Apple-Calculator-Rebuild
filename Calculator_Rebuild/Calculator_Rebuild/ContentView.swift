//
//  ContentView.swift
//  Calculator_Rebuild
//  2023 (c) N3v1 - MIT
//  Created by NH on 30.07.23.
//

import SwiftUI

enum CalcButton: String {
    case one, two, three, four, five, six, seven, eight, nine, zero
    case equal, plus, minus, multiply, division
    case clear, plusMinus, percent, decimal
    
    var background: Color {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight,. nine, .zero, .decimal:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        case .equal, .plus, .minus, .multiply, .division:
            return Color(.orange)
        case .clear ,.plusMinus, .percent:
            return Color(.lightGray)
        }
    }
}

struct ContentView: View {
    
    let buttons: [[CalcButton]] = [
        [.clear, .plusMinus, .percent, .division],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                // MARK: RESULT AREA
                //Spacer()
                HStack {
                    Spacer()
                    Text("0")
                        .bold()
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                }
                .padding()
                
                // MARK: BUTTONS
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            Text(button.rawValue)
                                .foregroundColor(.white)
                                .font(.system(size: 32))
                                .frame(width: self.buttonWidth(), height: self.buttonWidth())
                                .background(button.background)
                                .cornerRadius(self.buttonWidth())
                        }
                    }
                }
                
            }
            .padding(.bottom)
        }
    }
    
    func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
