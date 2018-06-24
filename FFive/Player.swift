//
//  Player.swift
//  FFive
//
//  Created by Alexx Quan on 2018-06-15.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import Foundation
import SpriteKit

enum PlayerStats {
    static var playerHealth: Int = 100 + (level * 10)
    static var playerAttack: Int = 10 + level
    static var playerMagic: Int = 10 + level
    static var exp: Int = 0
    static var level: Int = 1
}

class Player: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init()")
    }
    
    init() {
        let texture = SKTexture(imageNamed: "hero8")
        super.init(texture: texture, color: .white,
                   size: texture.size())
        name = "Player"
        zPosition = 50
    }
}
//yo
