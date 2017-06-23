//
//  GameViewController.swift
//  botwalker
//
//  Created by Marty on 6/22/17.
//  Copyright © 2017 Marty. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleScene = TitleScene(size: self.view.bounds.size)
        let skview = self.view as! SKView
        skview.showsFPS = true
        skview.showsNodeCount = true
        skview.presentScene(titleScene)
    }
    
}
