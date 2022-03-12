//
//  ContentView.swift
//  Wordle_Game
//
//  Created by Ranula Ranatunga on 2022-03-12.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dm:WordleDM
    var body: some View {
        NavigationView {
            
            VStack {
                Spacer()
                VStack(spacing:3) {
                    ForEach(0...5, id: \.self) {
                        index in
                        GuessLettersView(guess: $dm.guesses[index])
                            .modifier(Shake(animatableData: CGFloat(dm.wrongAttempts[index])))
                    }
                }
                .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
                Spacer()
                KeyboardView()
                    .scaleEffect(Global.keyboardScale)
                    .padding(.top)
            }
          
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                        } label: {
                            Image(systemName: "questionmark.circle")
                        }
                    }
                    ToolbarItem(placement:.principal) {
                        Text("Wordle")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.primary)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack{
                            Button{
                            
                            } label: {
                                Image(systemName: "chart.bar")
                            }
                            Button {
                                
                            } label: {
                                Image(systemName: "gearshape.fill")
                            }
                        }
                        
                    }
                }
        }
                        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WordleDM())
    }
}
