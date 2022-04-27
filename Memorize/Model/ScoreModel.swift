//
//  ScoreData.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import Foundation

//MARK: - ScoreModel

struct ScoreModel: Identifiable {
    
    //MARK: Properties

    var id: UUID
    var theme: String
    var maxScore: Int
    var date: Date

    //MARK: Initializer
    
    init(_ theme: String, maxScore: Int) {
        id = UUID()
        self.theme = theme
        self.maxScore = maxScore
        date = Date()
    }
}
