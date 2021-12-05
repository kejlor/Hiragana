//
//  ContentView.swift
//  HiraganaCards
//
//  Created by Bartosz Wojtkowiak on 05/12/2021.
//

import SwiftUI

struct MovementButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 75, minHeight: 20)
            .padding()
            .foregroundColor(.black)
            .background(.pink)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(MovementButton())
    }
}

struct ContentView: View {
    @State private var currentAt = 0
    @State private var previousDisabled = true
    @State private var nextDisabled = false
    @State private var hiraganaChars = ["あ", "い", "う", "え", "お"]
    @State private var meaningChars = ["A", "I", "U", "E", "O"]
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Meaning: \(meaningChars[currentAt])")
                    .font(.title)
                Text(hiraganaChars[currentAt])
                    .font(.system(size: 200))
                    .padding()
                    .background(Circle()
                                    .fill(Color.red)
                                    .frame(width: 250, height: 250))
                Spacer()
                HStack {
                    Spacer()
                    Button("Previous", action: moveToPrevious)
                        .buttonStyle()
                        .disabled(currentAt == 0 ? true : false)
                    Spacer()
                    Button("Next", action: moveToNext)
                        .buttonStyle()
                        .disabled(currentAt < hiraganaChars.count - 1 ? false : true)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func moveToNext() {
        currentAt += 1
    }
    
    func moveToPrevious() {
        currentAt -= 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
