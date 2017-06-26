//  TitleScene.swift
//  botwalker
//
//  Created by Marty on 6/22/17.
//  Copyright © 2017 Marty. All rights reserved.
//

import SpriteKit

class TitleScene: SKScene {
    let about_btn = SKLabelNode(fontNamed: "Times New Roman")
    let temp_bot = SKSpriteNode(imageNamed: "tinybot.png")
    let start_btn = SKLabelNode(fontNamed: "Times New Roman")
    let bot_title = SKSpriteNode(imageNamed: "BotTitle.png")



    
    
    private var game_title = SKLabelNode(fontNamed: "Times New Roman")
    override func didMove( to view: SKView) {
     
       
        bot_title.position = CGPoint(x: self.size.width/2, y: self.size.height*0.9)
        self.addChild(bot_title)
        temp_bot.position = CGPoint(x: self.size.width/2, y: self.size.height*0.5)
        self.addChild(temp_bot)
        start_btn.text = "Start"
        start_btn.position = CGPoint(x:self.size.width*0.25, y: self.size.height*0.10)
        about_btn.text = "About"
        about_btn.position = CGPoint(x:self.size.width*0.75, y: self.size.height*0.10)
        addChild(start_btn)
        addChild(about_btn)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
        let pointTouch = touch.location(in: self)
        if atPoint (pointTouch) == about_btn{
            let currentScene = AboutScene(size: self.size)
            let transition = SKTransition.doorsOpenHorizontal(withDuration: 0.8)
            self.view?.presentScene(currentScene, transition:transition)
        } else if atPoint(pointTouch) == start_btn{
            let currentScene = DashboardScene(size: self.size)
            let transition = SKTransition.doorsOpenHorizontal(withDuration:0.8)
            self.view?.presentScene(currentScene, transition:transition)

            }
        }
        
    }

}
