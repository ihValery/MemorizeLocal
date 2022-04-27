//
//  ThemeViewModel.swift
//  ThemeAplication
//
//  Created by Валерий Игнатьев on 20.05.21.
//

import Foundation

final public class ThemeViewModel: ObservableObject {
    
    //MARK: - Properties
    
    static let shared = ThemeViewModel()
    
    @Published var current: Int = UserDefaults.standard.integer(forKey: "Theme") {
        didSet {
            UserDefaults.standard.set(self.current, forKey: "Theme")
        }
    }
    
    //MARK: - Initializer
    
    private init() {}
}
