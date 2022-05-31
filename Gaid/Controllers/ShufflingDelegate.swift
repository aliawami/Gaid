//
//  ShufflingDelegate.swift
//  Gaid
//
//  Created by Ali Alawami on 26/05/2022.
//

import Foundation


protocol ShfflingDelegate{
    var shufflerID:Int {get set}
    var shufflingType: ShufflingType { get set}
    func startShuffler(id:Int)
    func changeShuffling(type: ShufflingType)
    func typeOfShuffling()-> ShufflingType
    func shuffeler(id: Int)
}
