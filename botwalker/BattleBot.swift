//
//  BattleBot.swift
//  botwalker
//
//  Created by Marty on 6/24/17.
//  Copyright © 2017 Marty. All rights reserved.
//

import Foundation

class BattleBot {
    
    var hp: Int
    var attk: Int
    var state: String?
    var energy: Int?
    var maxEnergy: Int?
    var actionTime: Float
    enum States {
        case can_act, attacking, defending, stunned, dead
    }
    
    init(hp: Int, attk: Int, actionTime: Float) {
        self.hp = hp
        self.attk = attk
        self.actionTime = actionTime
    }
}
