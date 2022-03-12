//
//  LetterButtonView.swift
//  Wordle_Game
//
//  Created by Ranula Ranatunga on 2022-03-12.
//

import SwiftUI

struct LetterButtonView: View {
    
    @EnvironmentObject var dm:WordleDM
    
    var letter:String
    
    var body: some View {
        Button {
            dm.addingCurrentWord(letter)
        } label: {
             Text(letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .background(dm.keyColors[letter])
                .foregroundColor(.primary)
        }
        .buttonStyle(.plain)
    }
}

struct LetterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LetterButtonView(letter: "O")
            .environmentObject(WordleDM())
    }
}
