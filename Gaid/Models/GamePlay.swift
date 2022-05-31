//
//  GamePlay.swift
//  Gaid
//
//  Created by Ali Alawami on 26/05/2022.
//

import Foundation

/*
 Any game in the word would have at least a player
 */
protocol GamePlay{
    var id: Int { get }
    var players: [GamePlayer] {set get }
    
}
