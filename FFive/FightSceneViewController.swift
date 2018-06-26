//
//  FightScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-13.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

protocol BattleProtocol {
    func playerFight()
    
}

class FightSceneViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "FightScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
                
                view.showsFPS = true
                view.showsNodeCount = true
            }
        }
    }

    @IBAction func buttonAttack(_ sender: UIButton) {
        print("Attack!!!")
    }
 
    @IBAction func buttonMagic(_ sender: UIButton) {
        print("PooOOOf!!...")
        
    }
    @IBAction func buttonRun(_ sender: UIButton) {
        print("Run To The Hills!")    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
