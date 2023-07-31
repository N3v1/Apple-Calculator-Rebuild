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
    
    var title: String {
        switch self {
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .zero: return "0"
        case .equal: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "x"
        case .division: return "/"
        case .clear: return "AC"
        case .plusMinus: return "+/-"
        case .percent: return "%"
        case .decimal: return "."
        }
    }
    
    var fontColor: Color {
        switch self {
        case .zero, .one, .two, .three ,.four, .five, .six, .seven, .eight, .nine, .equal, .plus, .minus, .multiply, .division, .decimal: return Color(.white)
                
        case .clear, .plusMinus, .percent: return Color(.black)
        }
    }
    
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

// MARK: ENVIRONMENT OBJ
class GlobalEnv: ObservableObject {
    
    @Published var display = ""
    
}

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnv
//    @State var value = "0"
    
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
                    Text(env.display)
                        .bold()
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                }
                .padding()
                
                // MARK: BUTTONS
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            Button {
                                
                            } label: {
                                Text(button.title)
                                    .foregroundColor(button.fontColor) // .white
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - (5 * 12)) / 4)
                                    .background(button.background)
                                    .cornerRadius(self.buttonWidth(button: button))
                            }
                        }
                    }
                }
                
            }
            .padding(.bottom)
        }
    }
    
    func buttonWidth(button: CalcButton) -> CGFloat {
        if button == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnv())
    }
}
