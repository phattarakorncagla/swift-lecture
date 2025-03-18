//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Phattarakorn Kaewchukul on 2025/03/10.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack{
                cards
                    .animation(.default, value: viewModel.cards)
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: aspectRatio) { card in
                        CardView(card)
                        .padding(spacing)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
        }
        .foregroundColor(.red)
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
