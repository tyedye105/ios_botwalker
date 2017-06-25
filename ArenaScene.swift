//
//  ArenaScene.swift
//  botwalker
//
//  Created by Marty on 6/25/17.
//  Copyright © 2017 Marty. All rights reserved.
//

import SpriteKit

class ArenaScene: SKScene {
    let sceneTitle = SKLabelNode(fontNamed: "Times New Roman")
    let winCondition = SKLabelNode(fontNamed: "Times New Roman")
    let atkexpl = SKLabelNode(fontNamed: "Times New Roman")
    let defexpl = SKLabelNode(fontNamed: "Times New Roman")
    let atbexpl = SKLabelNode(fontNamed: "Times New Roman")
    let sbreakexpl = SKLabelNode(fontNamed: "Times New Roman")
    let beginFight = SKLabelNode(fontNamed: "Times New Roman")
    let back = SKLabelNode(fontNamed: "Times New Roman")


    
    
    override func didMove(to view: SKView) {
        sceneTitle.text = "Welcome to the Bot Battle Arena"
        winCondition.text = "Fights are one 60 second round. Last one standing with the most hp wins!"
        atkexpl.text = "For 10 energy you attack reducing your opponent's hp"
        defexpl.text = "For 5 energy you forgo attacking to defend yourself reducing damage taken"
        sbreakexpl.text = "For 20 you perform an attack if done at the right time, stuns your opponent!"
        atbexpl.text = "Currently your bot can process one action per second!"
        back.text = "Back to the B.O.T Dash"
        if (BotData.data.energy) >= 100 && (BotData.data.energy) < 150 {
            beginFight.text = "You meet the minimum energy requiremnts, but good luck pulling off a win!"
        } else if (BotData.data.energy) >= 150 && (BotData.data.energy) < 200 {
            beginFight.text = "You should be able to put a decent fight, good luck!"
        } else if (BotData.data.energy) == 200 {
            beginFight.text = "Your're ready Roc-, I mean good luck!"
        }
        sceneTitle.position = CGPoint(x: self.size.width/2, y: self.size.height*0.9)
        winCondition.position = CGPoint(x: self.size.width/2, y: self.size.height*0.8)
        atkexpl.position = CGPoint(x: self.size.width/2, y: self.size.height*0.7)
        defexpl.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        sbreakexpl.position = CGPoint(x: self.size.width/2, y: self.size.height*0.5)
        atbexpl.position = CGPoint(x: self.size.width/2, y: self.size.height*0.4)
        beginFight.position = CGPoint(x: self.size.width/2, y: self.size.height*0.25)
        back.position = CGPoint(x: self.size.width/2, y: self.size.height*0.15)
        sceneTitle.fontSize = 45
        winCondition.fontSize = 20
        atkexpl.fontSize = 20
        defexpl.fontSize = 20
        sbreakexpl.fontSize = 20
        atbexpl.fontSize = 20
        beginFight.fontSize = 25
        back.fontSize = 25

        addChild(sceneTitle)
        addChild(winCondition)
        addChild(atkexpl)
        addChild(defexpl)
        addChild(sbreakexpl)
        addChild(atbexpl)
        addChild(back)
        addChild(beginFight)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
          let pointTouch = touch.location(in: self)
            if atPoint(pointTouch) == back {
                let currentScene = DashboardScene(size: self.size)
                let transition = SKTransition.doorsCloseVertical(withDuration: 0.8)
                self.view?.presentScene(currentScene, transition:transition)
            }
            
        }
    }
}
