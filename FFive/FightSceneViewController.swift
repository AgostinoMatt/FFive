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
        fightScene?.playerFight()
        
        print("attack")
    }
    
 
    @IBAction func buttonMagic(_ sender: UIButton) {
        print("PooOOOf!!...")
        
    }
    @IBAction func buttonRun(_ sender: UIButton) {
        print("Run To The Hills!")
        self.navigationController?.popViewController(animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
