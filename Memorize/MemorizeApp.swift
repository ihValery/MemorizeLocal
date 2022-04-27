//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 18.04.21.
//

import SwiftUI
//import Firebase

@main
struct MemorizeApp: App {
    let score = ScoreViewModel().scoreSheet
    let date = ScoreViewModel().dateToString()
    
    var body: some Scene {
        WindowGroup {
//            SideMenuMainView()
            OneCardScoreView(score.theme, date: date, maxScore: score.maxScore)
        }
    }
}
