//
//  WalkerCore.swift
//  botwalker
//
//  Created by Marty on 6/24/17.
//  Copyright © 2017 Marty. All rights reserved.
//

import Foundation
import SpriteKit
import CoreMotion

class WalkerCore {
    var name: String?
    var is_walking = false
    var experience = 0
    var core_level = 0
    var current_steps = 0
    var all_steps = 0
    
    
    init(name: String) {
        self.name = name
    }
   
}

