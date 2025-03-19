//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Phattarakorn Kaewchukul on 2025/03/13.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["😂", "❤️", "😍", "👌", "☺️", "😊", "😘", "😭", "😩", "💕", "😔", "😏", "😁"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairOfCards: 10) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "🖕"
            }
            
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle () {
        model.shuffle()
    }
}
