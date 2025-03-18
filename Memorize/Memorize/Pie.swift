//
//  Pie.swift
//  Memorize
//
//  Created by Phattarakorn Kaewchukul on 2025/03/18.
//

import SwiftUI
import CoreGraphics

struct Pie: Shape {
    var startAngle: Angle = Angle.zero
    let endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        let startAngle = startAngle - .degrees(90)
        let endAngle = endAngle - .degrees(90)
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians) ,
            y: center.x + radius * sin(startAngle.radians)
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
                 radius: radius,
                 startAngle: startAngle,
                 endAngle: endAngle,
            clockwise: false
        )
        p.addLine(to: center)
        
        return p
    }
}
