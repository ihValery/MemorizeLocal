//
//  Pie.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 5.05.21.
//

import SwiftUI

struct Pie: Shape {
    
    //MARK: - Properties
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise = false
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set {
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    //MARK: - Public Methods
    
    //Аббревиатура CG — это Core Graphics
    func path(in rect: CGRect) -> Path {
        //начнем с середины прямоугольника rect, который нам дан
        let center = CGPoint(x: rect.midX, y: rect.midY)
        //Наименьшее делим на два, мы ведь в прямоугольнике
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(x: center.x + radius * cos(CGFloat(startAngle.radians)) ,
                            y: center.y + radius * sin(CGFloat(startAngle.radians)))
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        p.addLine(to: center)
        
        return p
    }
    
}
