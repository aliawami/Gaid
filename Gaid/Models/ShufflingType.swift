//
//  ShufflingType.swift
//  Gaid
//
//  Created by Ali Alawami on 26/05/2022.
//

import Foundation


enum ShufflingType{
    case lower, turn
    
    func doulbing(score: Int, lowest: Int)->Int{
        switch(self){
        case .lower:
            switch(score){
            case 7...9 where (lowest < 10 && 6 < lowest):
                return score * 2
            case 10...13 where (lowest < 13):
                return score * 3
            default:
                return score
            }
//            return 0
        case .turn:
            switch(score){
            case 7...8 where (lowest < 9 && 6 < lowest):
                return score * 2
            case 9 where (lowest < 9 && 6 < lowest):
                return score * 3
            case 10...13 where (lowest < 13):
                return score * 4
            default:
                return score
            }
//            return 0
        }
    }
}
