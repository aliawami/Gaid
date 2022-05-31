//
//  GameName.swift
//  Gaid
//
//  Created by Ali Alawami on 28/05/2022.
//

import Foundation


enum GameNames:String, CaseIterable{
    case Tarnib, Baloot
    
    
    var playersCount:Int{
        switch(self){
        case .Baloot:
            return 2
        case .Tarnib:
            return 4
        }
    }
    
    var winningScore:Int{
        switch(self){
        case .Baloot:
            return 152
        case .Tarnib:
            return 41
        }
    }
    
}
