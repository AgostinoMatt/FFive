//
//  StatsSceneViewController.swift
//  FFive
//
//  Created by Matt Agostino on 2018-07-02.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class StatsSceneViewController: UIViewController{
    
    var statsScene: StatsScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            statsScene = SKScene(fileNamed: "StatsScene") as! StatsScene
            // Set the scale mode to scale to fit the window
            statsScene.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(statsScene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    @IBAction func BackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
