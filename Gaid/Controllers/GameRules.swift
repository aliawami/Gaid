//
//  GameRules.swift
//  Gaid
//
//  Created by Ali Alawami on 04/06/2022.
//

import Foundation


struct GameRules{
    func checkMinimumBuyingAmmount(_ total:Int)->Int{
        if -100 < total && total < 30{
            return 2
        }else{
            let floatTotal = Double(total)
            let div = floatTotal / 10
            let toInt = Int(div)
            print("divid\(toInt)")
            return toInt
        }
    }
    
    
}
