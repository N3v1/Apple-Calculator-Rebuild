//
//  ContentView.swift
//  Calculator_Rebuild
//
//  Created by Nevio Hirani on 30.07.23.
//

import SwiftUI

enum CalcButton {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case zero
    case plus
    case minus
    case multiply
    case division
    case equal
    case clear
    case decimal
    case percent
    case negativeP
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                //MARK: RESULT AREA
                HStack {
                    Spacer()
                    
                    Text("0")
                        .bold()
                        .font(.system(size: 64))
                    .foregroundColor(.white)
                }
                .padding()
                
                //MARK: BUTTONS
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
