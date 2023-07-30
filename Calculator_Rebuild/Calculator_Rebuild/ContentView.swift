//
//  ContentView.swift
//  Calculator_Rebuild
//
//  Created by Nevio Hirani on 30.07.23.
//

import SwiftUI

struct ContentView: View {
    
    let buttons = [
        ["AC", "+/-", "%", "/"],
        ["7", "8", "9", "x"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                // MARK: RESULT AREA
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
                    HStack {
                        ForEach(row, id: \.self) { items in
                            Text(items)
                                .foregroundColor(.white)
                                .font(.system(size: 32))
                                .frame(width: 80, height: 80)
                        }
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
