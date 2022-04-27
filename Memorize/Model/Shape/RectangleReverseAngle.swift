//
//  RectangleReverseAngle.swift
//  FirebaseProfile
//
//  Created by Валерий Игнатьев on 10.06.21.
//

import SwiftUI

struct RectangleReverseAngle: Shape {
    
    //MARK: - Properties

    var startY: CGFloat
    
    //MARK: - Public Methods

    func path(in rect: CGRect) -> Path {
        let startPoint = CGPoint(x: rect.width, y: startY)
        
        var path = Path()
        
        path.move(to: startPoint)
        path.addQuadCurve(to: CGPoint(x: rect.width - 70, y: startY + 70),
                          control: CGPoint(x: rect.width, y: startY + 70))
        path.addLine(to: CGPoint(x: 80, y: startY + 70))
        path.addQuadCurve(to: CGPoint(x: 10, y: startY + 140),
                          control: CGPoint(x: 10, y: startY + 70))
        path.addLine(to: CGPoint(x: 10, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.closeSubpath()
        
        return path
    }
    
}

struct RectangleReverseAngle_Previews: PreviewProvider {
    static var previews: some View {
        RectangleReverseAngle(startY: 80)
    }
}
