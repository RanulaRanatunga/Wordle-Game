//
//  WordleDataModel.swift
//  Wordle_Game
//
//  Created by Ranula Ranatunga on 2022-03-12.
//

import SwiftUI

class WordleDM: ObservableObject {
    
    @Published var guesses: [GuessLetters] = []
    @Published var wrongAttempts = [Int](repeating: 0, count:6)
    
    var keyColors = [String: Color]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var playGame = false
    var gameOver = false
    
    var gameStarted: Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disabledKeys : Bool {
        !playGame || currentWord.count == 5
    }
    
    init() {
        worldeGame()
    }
    
    func worldeGame() {
        populateGameDefaults()
        selectedWord = Global.commonWords.randomElement()!
        currentWord = ""
        playGame = true
    }
    
    func populateGameDefaults() {
        guesses=[]
        for index in 0...5 {
            guesses.append(GuessLetters(index: index))
        }
        
        let keyLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in keyLetters {
            keyColors[String(char)] = .unused
        }
    }
    
    func addingCurrentWord(_ letter: String) {
        currentWord += letter
        updateRow()
    }
    
    func enterButton() {
        if currentWord == selectedWord {
            gameOver = true
            print("You win")
            setCurrentGuessColors()
            playGame = false
        } else {
            if verifyWord(){
                print("Word is valid")
                setCurrentGuessColors()
                tryIndex += 1
                if tryIndex == 6 {
                    gameOver = true
                    playGame = false
                    print("You loosed")
                }
            }
            else {
                withAnimation {
                    self.wrongAttempts[tryIndex] += 1
                }
                wrongAttempts[tryIndex] = 0
            }
        }
        
      
    }
    
    func deleteButton() {
        currentWord.removeLast()
        updateRow()
    }
    
    func updateRow() {
        let guessingWord = currentWord.padding(toLength: 5, withPad: "", startingAt: 0)
        guesses[tryIndex].word = guessingWord
    }
    
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
    
    func setCurrentGuessColors() {
        
    }
    
   
    
}
