//
//  AboutScene.swift
//  botwalker
//
//  Created by Marty on 6/23/17.
//  Copyright © 2017 Marty. All rights reserved.
//

import SpriteKit

class AboutScene: SKScene {
    let goBack = SKLabelNode(fontNamed: "Times New Roman")
    override func didMove(to view: SKView) {
      
        goBack.text = "Click Here to return to the title screen"
        goBack.fontSize = 20
        goBack.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.05)
        goBack.fontColor = SKColor.white
        goBack.zPosition = 1
        addChild(goBack)
        
        let aboutThing = SKSpriteNode(imageNamed: "botwalkerabout.png")
        aboutThing.anchorPoint = CGPoint(x:0, y: 0)
        aboutThing.position = CGPoint(x:0 , y:0)
        aboutThing.size.width = self.size.width
        aboutThing.size.height = self.size.height
        aboutThing.zPosition = 0
        addChild(aboutThing)
        }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let pointTouch = touch.location(in: self)
            if atPoint(pointTouch) == goBack {
                let currentScene = TitleScene(size: self.size)
                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.8)
                self.view?.presentScene(currentScene, transition: transition)
                
            }
        }
    }
}
