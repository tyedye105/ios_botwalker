//
//  BotData.swift
//  botwalker
//
//  Created by Marty on 6/24/17.
//  Copyright © 2017 Marty. All rights reserved.
//

class BotData {
    static let data = BotData()
    var energy = 200
    let maxEnergy = 200
    var playerBot = BattleBot(hp: 100, attk: 9, actionTime:1.0)
    
}
