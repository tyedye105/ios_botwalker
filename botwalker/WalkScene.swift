//
//  WalkScene.swift
//  botwalker
//
//  Created by Marty on 6/24/17.
//  Copyright © 2017 Marty. All rights reserved.
//

import SpriteKit

class WalkScene: SKScene {
    let toDash = SKLabelNode(fontNamed: "Times New Roman")
    override func didMove(to view: SKView) {
        toDash.text = "Return to Bot Menu"
        toDash.position = CGPoint(x: self.size.width/2, y: self.size.height*0.10)
        addChild(toDash)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let pointTouch = touch.location(in: self)
            let currentScene = DashboardScene(size: self.size)
            if atPoint(pointTouch) == toDash {
                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.8)
                self.view?.presentScene(currentScene, transition: transition)

            }
        }
    }
}
