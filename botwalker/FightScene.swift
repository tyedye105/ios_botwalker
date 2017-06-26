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
    var boutDur = 60
    let results = SKLabelNode(fontNamed: "Times New Roman")
    var playerBot = BattleBot(hp: 100, attk: 9, energy: BotData.data.energy, maxEnergy: BotData.data.maxEnergy, actionTime: 1.0)
    var enemyBot = BattleBot(hp: 100, attk: 9, energy: 100, maxEnergy: 100, actionTime: 1.0)
    let playerHp = SKLabelNode(fontNamed: "Times New Roman")
    let playerEn = SKLabelNode(fontNamed: "Times New Roman")
    let enemyHp = SKLabelNode(fontNamed: "Times New Roman")
    let enemyEn = SKLabelNode(fontNamed: "Times New Roman")
    let attack = SKLabelNode(fontNamed: "Times New Roman")
    let defend = SKLabelNode(fontNamed: "Times New Roman")
    let shieldBreak = SKLabelNode(fontNamed: "Times New Roman")
    var stopClock = false
    var playerTimer = 1.0
    var enemyTimer = 1.0
    var tmpBot1 = SKSpriteNode(imageNamed: "bot_wSword.png")
    var tmpBot2 = SKSpriteNode(imageNamed: "bot_wSword2.png")

    
    
    override func didMove(to view: SKView) {
        tmpBot1.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.62)
        tmpBot2.position = CGPoint(x: self.size.width*0.75, y: self.size.height*0.58)
        addChild(tmpBot1)
        addChild(tmpBot2)
        enemyBot.state = "can_act"
        playerBot.state = "can_act"
        boutTime.fontSize = 60
        boutTime.text = "\(boutDur)"
        boutTime.position = CGPoint(x: self.size.width/2, y: self.size.height*0.8)
        self.addChild(boutTime)
        results.text = "That guy won"
        results.position = CGPoint(x: self.size.width/2, y: self.size.height*0.50)
        results.isHidden = true
        addChild(results)
        playerHp.text = "Hp: \(playerBot.hp) / 100"
        playerEn.text = "Energy:\(playerBot.hp)"
        playerHp.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.90)
        playerEn.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.80)
        enemyHp.text = "Hp: \(enemyBot.hp) / 100"
        enemyEn.text = "Energy:\(enemyBot.hp)"
        enemyHp.position = CGPoint(x: self.size.width*0.75, y: self.size.height*0.90)
        enemyEn.position = CGPoint(x: self.size.width*0.75, y: self.size.height*0.80)
        addChild(playerHp)
        addChild(playerEn)
        addChild(enemyHp)
        addChild(enemyEn)
        attack.text = "Attack! (10)"
        defend.text = "Defend!(5)"
        shieldBreak.text = "Shield Breaker(25)"
        attack.position = CGPoint(x: self.size.width*0.20, y: self.size.height*0.2)
        defend.position = CGPoint(x: self.size.width*0.50, y: self.size.height*0.2)
        shieldBreak.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.2)
        attack.fontSize = 25
        defend.fontSize = 25
        shieldBreak.fontSize = 25
        addChild(attack)
        addChild(defend)
        addChild(shieldBreak)
 
        let boutFinished = SKAction.run{self.boutTime.run(SKAction.repeatForever(SKAction.sequence([SKAction.run {
                    if self.boutDur > 0 && self.stopClock == false {
                        self.boutDur -= 1
                        self.boutTime.text = "\(self.boutDur)"
                        
                       if self.enemyBot.hp <= 0 {
                            self.results.isHidden = false
                            self.results.text = "You win!"
                            self.stopClock = true
                        } else if self.playerBot.hp <= 0 {
                            self.results.isHidden = false
                            self.results.text = "You Lose!"
                            self.stopClock = true

                        } else if self.playerBot.energy <= 0 || self.enemyBot.energy <= 0 {
                            if self.playerBot.hp > self.enemyBot.hp {
                                self.results.isHidden = false
                                self.results.text = "You win!"
                                self.stopClock = true
                            } else if self.playerBot.hp < self.enemyBot.hp {
                                self.results.isHidden = false
                                self.results.text = "You Lose!"
                                self.stopClock = true
                            } else if self.playerBot.hp == self.enemyBot.hp {
                                self.results.isHidden = false
                                self.results.text = "Its a draw!!"
                                self.stopClock = true
                            }
                        }
            
                    } else {
                        
                        self.boutDur = 0
                        if self.playerBot.hp > self.enemyBot.hp {
                            self.results.isHidden = false
                            self.results.text = "You win!"
                            
                        } else if self.playerBot.hp < self.enemyBot.hp {
                            self.results.isHidden = false
                            self.results.text = "You Lose!"
                        } else if self.playerBot.hp == self.enemyBot.hp {
                            self.results.isHidden = false
                            self.results.text = "Its a draw!!"
                        }
                        
                        }
                    },SKAction.wait(forDuration: 1)])))
                }
        
        self.run(boutFinished)
      
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let pointTouch = touch.location(in: self)
            if atPoint(pointTouch) == boutTime {
                let currentScene = DashboardScene(size: self.size)
                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.8)
                self.view?.presentScene(currentScene, transition: transition)
            } else if atPoint(pointTouch) == attack {
                if playerBot.state == "can_act" {
                    if playerBot.energy >= 10 {
                        enemyBot.hp -= playerBot.attk
                        enemyHp.text = "Hp: \(enemyBot.hp) / 100"
                        playerBot.energy -= 10
                        playerEn.text = "Energy:\(playerBot.energy)"
                    } else {
                        attack.text = "not enough energy!"
                    }
                }
            }

        }
    
          
        
    }

}
            
            

