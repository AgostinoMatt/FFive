//
//  GameViewController.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-06.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .resizeFill
                
                // Present the scene
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
                
                view.showsFPS = true
                view.showsNodeCount = true
            }
        }
    }

    @IBAction func buttonClick(_ sender: Any) {
        let fightScene = storyboard?.instantiateViewController(withIdentifier: "FightSceneViewController") as! FightSceneViewController
        
        self.navigationController?.pushViewController(fightScene, animated: true)
    }
    
    @IBAction func StatsButton(_ sender: Any) {
        let statsScene = storyboard?.instantiateViewController(withIdentifier: "StatsSceneViewController") as! StatsSceneViewController
        
        self.navigationController?.pushViewController(statsScene, animated: true)
    }
    @IBAction func NexitScene(_ sender: Any) {
        let nexitScene = storyboard?.instantiateViewController(withIdentifier: "NexitSceneViewController") as! NexitSceneViewController
        
        self.navigationController?.pushViewController(nexitScene, animated: true)
    }
    @IBOutlet weak var NexitScene: UIButton!
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
