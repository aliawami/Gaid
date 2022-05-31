//
//  GamePlayer.swift
//  Gaid
//
//  Created by Ali Alawami on 26/05/2022.
//

import Foundation


final class GamePlayer: Player, Identifiable{
//    var teamName: String
    
    var id: Int
    
    var name: String = ""
    
    private var teamName: String = ""
    
    var finalScore:Int{
        get { return scores.reduce(0) { $0 + $1} }
    }
    
    var scores =  [Int]()
    
    //Current order will be what the user order during the game
    var currentOrder: Int
    
    var isShuffeler: Bool = false
    
    
    
    init(id: Int){
        self.id = id
//        self.name = "Player\(id)"
//        self.teamName = team
        currentOrder = 0
    }
    
    func playerID()->Int{
        return self.id
    }
    
    
    func newOrder(_ buying: Int){
        currentOrder = buying
    }
    
    func lastOrder(isSuccess: Bool = true){
        if isSuccess{
            scores.append(currentOrder)
        }else{
            scores.append((currentOrder * -1))
        }
    }
    
    func teamName(_ name: String){
        teamName = name
    }
    func team()->String{
        return teamName
    }
    
    func total()-> Int{
        finalScore
    }
    
    func shuffelter(){
        isShuffeler = true
    }
    
    func playerName()->String{
        name
    }
    
    func myName(_ name: String){
        self.name = name
    }
    
    
}
