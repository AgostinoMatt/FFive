//
//  FightScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-20.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit

class FightScene: SKScene {
    
    var lastUpdateTime: TimeInterval = 0
    var deltaTime: TimeInterval = 0
    var background: SKTileMapNode!
    
    var playableRect: CGRect!
    
    let cameraNode = SKCameraNode()
    let cameraMovePointPerSec: CGFloat = 200.0
    var cameraRect: CGRect {
        let x = cameraNode.position.x - size.width / 2 + (size.width - playableRect.width) / 2
        let y = cameraNode.position.y - size.height / 2 + (size.height - playableRect.height) / 2
        
        return CGRect(x: x, y: y, width: playableRect.width, height:
            playableRect.height)
    }
    
    required init?(coder aDecoder: NSCoder){
        
        
        super.init(coder: aDecoder)
        
        background = childNode(withName: "background") as? SKTileMapNode
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableHeight = size.width / maxAspectRatio
        let playableMargin = (size.height - playableHeight) / 2.0
        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
    }
}

