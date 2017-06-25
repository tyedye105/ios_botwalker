//
//  DashBoard.swift
//  botwalker
//
//  Created by Marty on 6/23/17.
//  Copyright © 2017 Marty. All rights reserved.
//

import SpriteKit


class DashboardScene: SKScene {
    var energyMeter = SKLabelNode(fontNamed: "Times New Roman")
    var tmpBot = SKShapeNode(rectOf: CGSize(width:200, height:200))
    let walk_btn = SKLabelNode(fontNamed: "Times New Roman")
    let fight_btn = SKLabelNode(fontNamed: "Time New ROman")
    var hpMeter = SKLabelNode(fontNamed: "Times New Roman")
    

    
    override func didMove(to view: SKView) {
        energyMeter.position = CGPoint(x: self.size.width/2 + self.size.width*0.25, y: self.size.height*0.90)
        energyMeter.text = "Current Energy:\(BotData.data.energy)"
        tmpBot.position = CGPoint(x: self.size.width/2 + self.size.width*0.25, y: self.size.height*0.50)
        walk_btn.text = "Charge the Core!"
            walk_btn.position = CGPoint(x:self.size.width*0.25, y: self.size.height*0.7)
            addChild(walk_btn)
        fight_btn.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.4)
        fight_btn.text = "Fight!"
            addChild(energyMeter)
            addChild(tmpBot)
            addChild(fight_btn)
        hpMeter.position = CGPoint(x: self.size.width/2 + self.size.width*0.25, y: self.size.height*0.80)
        hpMeter.text = "Current HP:\(BotData.data.playerBot.hp)"
            addChild(hpMeter)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let pointTouch = touch.location(in:self)
            if atPoint(pointTouch) == energyMeter{
                let currentScene = TitleScene(size:self.size)
                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.8)
                self.view?.presentScene(currentScene, transition: transition)
            } else if atPoint(pointTouch) == walk_btn {
                let currentScene = WalkScene (size:self.size)
                let transition = SKTransition.doorsOpenHorizontal(withDuration: 1)
                self.view?.presentScene(currentScene, transition: transition)
            } else if atPoint(pointTouch) == fight_btn {
                let currentScene = ArenaScene (size:self.size)
                let transition = SKTransition.doorsOpenVertical(withDuration: 1)
                self.view?.presentScene(currentScene, transition: transition)
            }
            
        }
    
    }
}
