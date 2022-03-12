//
//  KeyboardView.swift
//  Wordle_Game
//
//  Created by Ranula Ranatunga on 2022-03-12.
//

import SwiftUI

struct KeyboardView: View {
    @EnvironmentObject var dm: WordleDM
    var firstRowArray = "QWERTYUIOP".map{String($0)}
    var secondRowArray = "ASDFGHJKL".map{String($0)}
    var thirdRowArray = "ZXCVBNM".map{String($0)}
    var body: some View {
       
        VStack {
            HStack(spacing:2) {
                ForEach(firstRowArray, id: \.self) { letter in
                    LetterButtonView(letter: letter)
                }
                .disabled(dm.disabledKeys)
                .opacity(dm.disabledKeys ? 0.6 :1)
            }
                
                HStack(spacing:2) {
                    ForEach(secondRowArray, id: \.self) { letter in
                        LetterButtonView(letter: letter)
                    }
                    .disabled(dm.disabledKeys)
                    .opacity(dm.disabledKeys ? 0.6 :1)
                }
                    
                    HStack(spacing:2) {
                        Button {
                            dm.enterButton()
                        }label: {
                            Text("Enter")
                        }
                        .font(.system(size: 20))
                        .frame(width: 60, height: 50)
                        .foregroundColor(.primary)
                        .background(Color.unused)
                        .disabled(dm.currentWord.count < 5 || !dm.playGame)
                        .opacity((dm.currentWord.count < 5 || !dm.playGame) ? 0.6 : 1)
                        ForEach(thirdRowArray, id: \.self) { letter in
                            LetterButtonView(letter: letter)
                        
                    }
                        .disabled(dm.disabledKeys)
                        .opacity(dm.disabledKeys ? 0.6 :1)
                        Button {
                            dm.deleteButton()
                        }label: {
                            Image(systemName: "delete.backward.fill")
                                .font(.system(size: 20, weight: .heavy))
                                .frame(width: 40, height: 50)
                                .foregroundColor(.primary)
                                .background(Color.unused)
                        }
                        .disabled(!dm.playGame || dm.currentWord.count == 0)
                        .opacity((!dm.playGame || dm.currentWord.count == 0) ? 0.6:1)
                    }
                    
                }
    }
        }


struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView().environmentObject(WordleDM())
            .scaleEffect(Global.keyboardScale)
    }
}
    



