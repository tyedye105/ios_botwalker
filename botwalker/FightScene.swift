//
//  FightScene.swift
//  botwalker
//
//  Created by Marty on 6/25/17.
//  Copyright © 2017 Marty. All rights reserved.
//

import SpriteKit

class FightScene : SKScene {
    var boutTime = SKLabelNode(fontNamed: "TrebuchetMS-Bold")
    var boutDur = 5
    let results = SKLabelNode(fontNamed: "Times New Roman")
    var playerBot = BattleBot(hp: 100, attk: 9, actionTime: 1)
    var enemyBot = BattleBot(hp:99, attk:9, actionTime: 1)



    
    
    override func didMove(to view: SKView) {
        
        boutTime.fontSize = 60
        boutTime.text = "\(boutDur)"
        boutTime.position = CGPoint(x: self.size.width/2, y: self.size.height*0.8)
        self.addChild(boutTime)
        results.text = "That guy won"
        results.position = CGPoint(x: self.size.width/2, y: self.size.height*0.20)
        results.isHidden = true
        addChild(results)
        boutTime.run(SKAction.repeatForever(SKAction.sequence([SKAction.run {
            if self.boutDur > 0 {
            self.boutDur -= 1
            self.boutTime.text = "\(self.boutDur)"
            } else {
                
                self.boutDur = 0
                if self.playerBot.hp > self.enemyBot.hp {
                    self.results.isHidden = false
                    self.results.text = "You win!"
                    
                } else if self.playerBot.hp < self.enemyBot.hp {
                    self.results.isHidden = false
                    self.results.text = "You Lose!"
                }

            }
            },SKAction.wait(forDuration: 1)])))
    
      
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
           
     let pointTouch = touch.location(in: self)
            if atPoint(pointTouch) == boutTime {
                let currentScene = DashboardScene(size: self.size)
                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.8)
                self.view?.presentScene(currentScene, transition: transition)
                }
            }


    }
    
          
            
}
            
            

