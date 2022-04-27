//
//  Star.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 5.05.21.
//

import SwiftUI

struct Star: Shape {
    
    //MARK: - Properties
    
    var clockwise = false
    
    //MARK: - Public Methods

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let pointOne = CGPoint(x: center.x, y: center.y - radius)
        let pointTwo = CGPoint(x: center.x - radius + radius / 6, y: center.y + radius - radius / 6)
        let pointThree = CGPoint(x: center.x + radius, y: center.y - radius / 3)
        let pointFour = CGPoint(x: center.x - radius, y: center.y - radius / 3)
        let pointFive = CGPoint(x: center.x + radius - radius / 6, y: center.y + radius - radius / 6)
        
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: pointOne)
        p.addLine(to: pointTwo)
        p.addLine(to: pointThree)
        p.addLine(to: pointFour)
        p.addLine(to: pointFive)
        p.addLine(to: pointOne)
        
        return p
    }
    
}
