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
    
    var nexitScene: NexitScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            nexitScene = SKScene(fileNamed: "NexitScene") as! NexitScene
            // Set the scale mode to scale to fit the window
            nexitScene.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(nexitScene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    @IBAction func attackButton(_ sender: Any) {
        if nexitScene.canAttack{
            nexitScene.attack()
            nexitScene.playerFight()
            nexitScene.canAttack = false
        }
    }
    @IBAction func magicButton(_ sender: Any) {
        if nexitScene.canAttack{
            nexitScene.magic()
            nexitScene.playerFight()
            nexitScene.canAttack = false
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

