//
//  WalkScene.swift
//  botwalker
//
//  Created by Marty on 6/24/17.
//  Copyright © 2017 Marty. All rights reserved.
//


import SpriteKit
import CoreMotion




class WalkScene: SKScene {
    let pedometer = CMPedometer()
    let toDash = SKLabelNode(fontNamed: "Times New Roman")
    var maxedOut = SKLabelNode(fontNamed: "Times New Roman")
    var energyDisplay = SKLabelNode(fontNamed: "Times New Roman")
    var stepDisplay = SKLabelNode(fontNamed: "Times New Roman")
    var currentDate = Date()
    var currentSteps = 0
    let botData = BotData.data
    
    override func didMove(to view: SKView) {
        toDash.text = "\(CMPedometer.isStepCountingAvailable())" 
        toDash.position = CGPoint(x: self.size.width/2, y: self.size.height*0.10)
        addChild(toDash)
        stepDisplay.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        addChild((stepDisplay))
        energyDisplay.position = CGPoint(x: self.size.width/2, y: self.size.height*0.80)
        energyDisplay.text = "Current Energy:\(botData.energy)/\(botData.maxEnergy)"
        energyDisplay.zPosition = 1
        addChild(energyDisplay)
        maxedOut.zPosition = 0
        maxedOut.position = energyDisplay.position
        addChild(maxedOut)
   
        
        //Calls the pedometer to start live updating the data from a specific date. In this case, for the data when it is called. It will regularly call this method until you ask it to stop.
        pedometer.startUpdates(from: NSDate() as Date) { data, error in
            guard let activityData = data, error == nil else {
                print("There was an error getting the data: \(String(describing: error))")
                return
            }
            
            //You can than do something with the data that is being provided back.
            self.currentSteps = Int(activityData.numberOfSteps)
        }
       
        }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let pointTouch = touch.location(in: self)
            if atPoint(pointTouch) == toDash {
                let currentScene = DashboardScene(size: self.size)
                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.8)
                self.view?.presentScene(currentScene, transition: transition)
                
                }
            }
        }
    let remove = SKAction.removeFromParent()
    override func update(_ currentTime: TimeInterval = 0.01666) {
        stepDisplay.text = "Steps Taken: \(currentSteps)"
        if (botData.energy) > botData.maxEnergy {
            energyDisplay.text = " "
            maxedOut.text = "The core has reached maximum charge!"
            botData.energy = botData.maxEnergy
        } else if (botData.energy) < botData.maxEnergy {
            if currentSteps > 0 {
        botData.energy = Int(Float(currentSteps) * 3.5)
            energyDisplay.text = "Current Energy:\(botData.energy)/\(botData.maxEnergy)"
            maxedOut.text = " "
            }
        }
    }
}
