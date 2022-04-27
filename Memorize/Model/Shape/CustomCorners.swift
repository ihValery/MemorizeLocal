//
//  CustomCorners.swift
//  CustomSlideMenu
//
//  Created by Валерий Игнатьев on 17.05.21.
//

import SwiftUI

//CustomCorners что бы выбрать какие иглы закруглить
struct CustomCorners: Shape {
    
    //MARK: - Properties
    
    var corner: UIRectCorner
    var radius: CGFloat
    
    //MARK: - Public Methods
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corner,
                                cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
    
}
