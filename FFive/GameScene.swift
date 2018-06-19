//
//  GameScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-06.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var background: SKTileMapNode!
    var player = Player()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        background =
            childNode(withName: "background") as! SKTileMapNode
    }
    
    override func didMove(to view: SKView) {
        addChild(player)
    }
    
    
}
