//
//  GuessLettersView.swift
//  Wordle_Game
//
//  Created by Ranula Ranatunga on 2022-03-12.
//

import SwiftUI

struct GuessLettersView: View {
    
    @Binding var guess: GuessLetters
    var body: some View {
        HStack(spacing: 3) {
            ForEach(0...4, id: \.self) { index in
                Text(guess.guessLetters[index])
                    .foregroundColor(.primary)
                    .frame(minWidth: 0,  maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .background(Color.systemBackground)
                    .font(.system(size:35, weight:.heavy))
                    .border(Color(.secondaryLabel))
            }
        }
    }
 
    
  
}

struct GuessLettersView_Previews: PreviewProvider {
    static var previews: some View {
        GuessLettersView(guess: .constant(GuessLetters(index: 0)))
    }
}
