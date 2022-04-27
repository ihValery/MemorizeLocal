//
//  User.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 8.06.21.
//

import Foundation

struct User {
    
    //MARK: - Properties
    
    var uid: String
    var email: String?
    var userName: String?
    var avatarURL: String?
    
    //MARK: - Initializer

    init(uid: String, email: String?, userName: String? = nil, avatarURL: String? = nil) {
        self.uid = uid
        self.email = email
        self.userName = userName
        self.avatarURL = avatarURL
    }
}
