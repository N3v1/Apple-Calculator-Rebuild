//
//  ContentView.swift
//  Calculator_Rebuild
//
//  Created by Nevio Hirani on 30.07.23.
//

import SwiftUI

enum CalcButton {
    case one, two, three, four, five, six, seven, eight, nine, zero
    case equal, plus, minus, multiply, division
    case clear, plusMinus, percent, decimal
}

struct ContentView: View {
    
    let buttons = [
        ["AC", "+/-", "%", "/"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
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
                        ForEach(row, id: \.self) { items in
                            Text(items)
                                .foregroundColor(.white)
                                .font(.system(size: 32))
                                .frame(width: self.buttonWidth(), height: self.buttonWidth())
                                .background(Color.orange)
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
