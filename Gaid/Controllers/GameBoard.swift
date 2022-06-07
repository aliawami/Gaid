//
//  GameBoard.swift
//  Gaid
//
//  Created by Ali Alawami on 26/05/2022.
//

import Foundation


final class GameBoard:  ObservableObject, GamePlay{
    @Published var players: [GamePlayer] = []
    
    var id: Int
    let gameName:GameNames
    
    var groups = ["Us", "Them"]
    
    @Published var shufflerID: Int = 0
    
    //Does the double apply to this game
    var gameHasDouble:Bool = false
    //If yes then the double start from which number
    var doubleMinimum:Int = 7
    
    internal var shufflingType:ShufflingType = .turn
    
    
    
    init(id:Int, gameName:GameNames){
        self.id = id
        self.gameName = gameName
        self.initialWinningScore = self.gameName.winningScore
    }
    
    func newGame(){
        id += 1
        self.namingPlayers(names: Array.init(repeating: "Player", count: 4), groupsNames: [])
        shufflerID = 0
        
    }
    
    //Setting the players custom names
    //Placing each player to a group

    func namingPlayers(names:[String], groupsNames:[String] = []){
        if !groupsNames.isEmpty{
            groups = groupsNames
        }
        print("The names")
        for aName in names{
            
            print("name is \(aName)")
        }
        if !players.isEmpty{
            players = []
        }
        if !names.isEmpty{
        for index in 0 ..< names.count{
            let newPlayer = GamePlayer(id: index+1)
            newPlayer.myName(names[index])
            if names.count != 2{
                if (index+1) % 2 == 0{
                    newPlayer.teamName(groups.last!)
                }else{
                    newPlayer.teamName(groups.first!)
                }
            }
            players.append(newPlayer)
        }
        self.startShuffler(id: 1)
        }
    }
    
    func printPlayers(){
        for player in players {
            print("\(player.name), current \(player.theCurrentOrder())")
        }
    }

    
    
    
    
    

    /*
     TODO:
     Score traking
        -   Player
        -   Team
     Find the winner
      - Apply scoring rules
     
     
     */
    
    //Traking Score
    /*
     Each player stores his scores and totalScore will hold the final score.
     Team score needs to be monitored to see if the team is winner or not
     
     */
    var initialWinningScore:Int = 41
    
    func winner(){
        
        if shufflingType == .lower{
            
        }
    }
    
    
    
    
    
    
//    Set Double part
//    Set double rules
//    Allow to disable double
   
    
    //If doulbe is applied and the minum double has been set then the buy should be monitored
    //If the buying number is equal or higher than double then the  buying number should doulbed before inserting to scores
    func applyDouble(score: Int)->Int{
        if gameHasDouble{
            if score < doubleMinimum{
                return score
            }else{
               return shufflingType.doulbing(score: score, lowest: doubleMinimum)
            }
        }
        return score
    }
    
    
    
    
    
    
    
    
}

extension GameBoard: ShfflingDelegate{

    //when the game start the player could choose shuffler
    func startShuffler(id:Int){
        shufflerID = id
        players[shufflerID - 1].isShuffeler = true
    }
    
    func changeShuffling(type: ShufflingType){
        self.shufflingType = type
    }
    
    func typeOfShuffling()-> ShufflingType{
        shufflingType
    }
    
    func shuffeler(id: Int = 1){
        switch(shufflingType){
        case .turn:
            if shufflerID == players.count{
                players.last?.isShuffeler = false
                players.first?.isShuffeler = true
                shufflerID = 1
            }else{
                players[shufflerID-1].isShuffeler = false
                players[shufflerID].isShuffeler = true
                shufflerID += 1
            }
            print("shuffler id \(shufflerID)")
        case .lower:
            lowestScorePlayer()
            print("")
        }
        
    }
}


//Scores Monitoring
extension GameBoard{
    //Get the player with the lowest score
    func lowestScorePlayer(){
        var smallest = players[0]
            for item in players {
                if (item.finalScore < smallest.finalScore) {
                    smallest = item
                }
            }
        if smallest.id != shufflerID{
            players[shufflerID - 1].isShuffeler = false
            players[smallest.id - 1].isShuffeler = true
            shufflerID = smallest.id
        }
    }
    
    
    //Get the player with the highest score
    func highestScorePlayer(){
        var highest = players[0]
            for item in players {
                if (item.finalScore > highest.finalScore) {
                    highest = item
                }
            }

    }
}
