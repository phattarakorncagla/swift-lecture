//
//  CardView.swift
//  Memorize
//
//  Created by Phattarakorn Kaewchukul on 2025/03/18.
//

import SwiftUI

struct CardView: View {

    let card: Card

    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }

    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(0.3)
            .overlay(
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(5)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.spin(duration: 1),
                               value: card.isMatched)
            )
            .padding(5)
            .cardify(isFaceUp: card.isFaceUp)
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 1).repeatForever(autoreverses: false)
    }
}

typealias Card = MemoryGame<String>.Card
#Preview {
    VStack {
        HStack {
            CardView(Card(isFaceUp: true, content: "x", id: "test1"))
            CardView(Card(content: "x", id: "test1"))
        }
        HStack {
            CardView(
                Card(
                    isFaceUp: true, isMatched: true,
                    content:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non odio sed dui tempus ullamcorper. Duis aliquet dolor id sollicitudin malesuada. Nullam sit amet fringilla ipsum, id ullamcorper mauris. Sed et leo massa. Ut quis diam nibh. Praesent euismod tortor et sapien sollicitudin, sit amet rhoncus orci egestas. Suspendisse eget mattis arcu.",
                    id: "test1"))
            CardView(Card(isMatched: true, content: "x", id: "test1"))
        }
    }
    .padding(20)
    .foregroundColor(.blue)
}
