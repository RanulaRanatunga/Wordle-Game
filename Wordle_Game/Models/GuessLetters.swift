//
//  GuessLetters.swift
//  Wordle_Game
//
//  Created by Ranula Ranatunga on 2022-03-12.
//

import SwiftUI

struct GuessLetters {
    
    let index: Int
    var word = "   "
    var guessLetters: [String] {
        word.map{ String($0)}
    }
    var bgColors = [Color](repeating: .systemBackground, count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    
    
}
