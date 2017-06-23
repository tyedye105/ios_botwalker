//
//  AboutScene.swift
//  botwalker
//
//  Created by Marty on 6/23/17.
//  Copyright © 2017 Marty. All rights reserved.
//

import SpriteKit

class AboutScene: SKScene {
    override func didMove(to view: SKView) {
        let about1 = SKLabelNode(fontNamed: "Times New Roman")
        about1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        about1.text = "This is a thing, about a thing to see how much thing there is."
        about1.position = CGPoint(x: 0, y: self.size.height - 50)
        about1.fontColor = SKColor.white
        addChild(about1)
        
        let aboutThing = SKSpriteNode(imageNamed: "botwalkerabout")
        aboutThing.anchorPoint = CGPoint(x:0, y: 0)
        aboutThing.position = CGPoint(x:0 , y:0)
        aboutThing.size.width = self.size.width
        aboutThing.size.height = self.size.height
        addChild(aboutThing)
        }
}
