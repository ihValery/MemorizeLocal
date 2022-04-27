//
//  ScoreData.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import Foundation
//import FirebaseFirestoreSwift

struct Score: Identifiable, Codable {
    
    //MARK: - Properties

//    @DocumentID var id: String?
    var id: UUID = UUID.init()
    var theme: String
    var maxScore: Int
    var date = Date()
    var userId: String?
    
}

#if DEBUG
let testData = (1...10).map { item in
    Score(theme: "🧑🏽‍🚒", maxScore: -99)
}
#endif
