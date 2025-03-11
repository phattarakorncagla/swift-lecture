//
//  ContentView.swift
//  Memorize
//
//  Created by Phattarakorn Kaewchukul on 2025/03/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            let emojis: [String] = ["😂", "❤️", "😍", "👌"]
            CardView(content: emojis[0], isFaceUp: false)
            CardView(content: emojis[1])
            CardView(content: emojis[2], isFaceUp: true)
            CardView(content: emojis[3], isFaceUp: true)
        }
        .padding()
        .foregroundColor(.red)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                base.fill(.white)
                base
                    .strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
