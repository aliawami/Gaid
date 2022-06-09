//
//  ColorExtension.swift
//  Gaid
//
//  Created by Ali Alawami on 08/06/2022.
//

import SwiftUI


extension Color{
    static let myPrimaryColor =  Color("primaryColor")
    
    static let mySecondaryColor = Color("SecondaryColor")
    
    static let positiveColor = Color("positiveColor")
    
    static let negativeColor = Color("negativeColor")
    
    static let highlightColor = Color("highlightColor")
    
    static let lineColor = Color("lineColor")
}

extension UIColor{
    static let myPrimaryColor = UIColor(named: "primaryColor")
    
    static let mySecondaryColor = UIColor(named:"SecondaryColor")
    
    static let positiveColor = UIColor(named:"positiveColor")
    
    static let negativeColor = UIColor(named:"negativeColor")
    
    static let highlightColor = UIColor(named:"highlightColor")
    
    static let lineColor = UIColor(named:"lineColor")
}
