//
//  Wordle_GameApp.swift
//  Wordle_Game
//
//  Created by Ranula Ranatunga on 2022-03-12.
//

import SwiftUI

@main
struct Wordle_GameApp: App {
    @StateObject var dm = WordleDM()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dm)
        }
    }
}
