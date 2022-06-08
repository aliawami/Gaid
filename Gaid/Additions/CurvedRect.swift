//
//  CurvedRect.swift
//  Gaid
//
//  Created by Ali Alawami on 08/06/2022.
//

import SwiftUI

struct CurvedRect: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
            
        let width: CGFloat = rect.size.width / 2
        let height = rect.size.height / 2
//                let xScale: CGFloat = 0.832
//                let xOffset = (width * (1.0 - xScale)) / 2.0
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to:
            CGPoint(x: width * 2, y: 0))
        path.addLine(to:
        CGPoint(x: width * 2, y: height / 3))
//        path.addQuadCurve(to: CGPoint(x: width, y: height * 2), control: CGPoint(x: width * 2, y: height * 1.45))
        path.addCurve(to: CGPoint(x: 0, y: height * 2), control1: CGPoint(x: width * 2, y: height * 1.2), control2: CGPoint(x: width * 1.5 , y: height * 2))
//            path.addLine(to:
//            CGPoint(x: width * 2, y: height * 2))
//            path.addLine(to:
//            CGPoint(x: 0, y: height * 2))
//        path.addLine(to:
//        CGPoint(x: 0, y: 0))
            
            
        return path
    }
    
}

