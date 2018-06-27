//
//  NexitFight.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-27.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class NexitSceneViewController: UIViewController{
    
    var fightScene: FightScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            fightScene = SKScene(fileNamed: "FightScene") as! FightScene// change to scene for nexit
            // Set the scale mode to scale to fit the window
            fightScene.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(fightScene)
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

