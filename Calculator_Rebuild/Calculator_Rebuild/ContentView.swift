//
//  ContentView.swift
//  Calculator_Rebuild
//
//  Created by Nevio Hirani on 30.07.23.
//

import SwiftUI

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case plus = "+"
    case minus = "-"
    case multiply = "x"
    case division = "/"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    
    var buttonColor: Color {
        switch self {
            case .plus, .minus, .multiply, .division, .equal:
                return .orange
            case .clear, .negative, .percent:
                return Color(.lightGray)
            default:
                return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct ContentView: View {
    
    @State var value = "0"
    @State var currentOperation: Operation = .none
    @State var runningNumber = 0
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .division],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                // MARK: RESULT AREA
                HStack {
                    Spacer()
                    
                    Text(value)
                        .bold()
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                }
                .padding()
                
                // MARK: BUTTONS
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                self.didTap(button: item)
                            } label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(item: item), height: self.buttonHeight())
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item) / 2)
                            }

                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    func didTap(button: CalcButton) {
        switch button {
            case .plus, .minus, .multiply, .division, .equal:
                if button == .plus {
                    self.currentOperation = .add
                    self.runningNumber = Int(self.value) ?? 0
                } else if button == .minus {
                    self.currentOperation = .subtract
                    self.runningNumber = Int(self.value) ?? 0
                } else if button == .multiply {
                    self.currentOperation = .multiply
                    self.runningNumber = Int(self.value) ?? 0
                } else if button == .division {
                    self.currentOperation = .divide
                    self.runningNumber = Int(self.value) ?? 0
                } else if button == .equal {
                    let runningValue = self.runningNumber
                    let currentValue = Int(self.value) ?? 0
                    switch self.currentOperation {
                        case .add: self.value = "\(runningValue + currentValue)"
                        case .subtract: self.value = "\(runningValue - currentValue)"
                        case .multiply: self.value = "\(runningValue * currentValue)"
                        case .divide: self.value = "\(runningValue / currentValue)"
                        case .none: break
                    }
                }
            case .clear:
                self.value = "0"
            case .decimal, .negative, .percent:
                break
            default:
                let number = button.rawValue
                if self.value == "0" {
                    value = number
                } else {
                    self.value = "\(self.value)\(number)"
                }
        }
    }
    
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4 ) * 2
        }
        
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
