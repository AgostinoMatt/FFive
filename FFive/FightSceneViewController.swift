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

class FightSceneViewController: UIViewController{
    
    var fightScene: FightScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            fightScene = SKScene(fileNamed: "FightScene") as! FightScene
            // Set the scale mode to scale to fit the window
            fightScene.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(fightScene)
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    @IBAction func buttonAttack(_ sender: UIButton) {
        if fightScene.canAttack == true {
            fightScene.attack()
            fightScene.playerFight()
            //print("Attack!")
            fightScene.canAttack = false
        }
    }
    
    @IBAction func buttonMagic(_ sender: UIButton) {
        if fightScene.canAttack == true {
            fightScene.magic()
            fightScene.playerFight()
            //print("Magic")
            fightScene.canAttack = false
        }
    }
    
    @IBAction func buttonRun(_ sender: UIButton) {
        //print("Run Away!")
        Warrior.shared.health = Warrior.shared.maxHealth
        Mage.shared.health = Mage.shared.maxHealth
        Heavy.shared.health = Heavy.shared.maxHealth
        self.navigationController?.popViewController(animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
