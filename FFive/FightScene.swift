//
//  FightScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-20.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit

class FightScene: SKScene {
    
    var playerTurn = 0
    
    var enemyAlive = true
    
    let playableRect: CGRect
    
    let cameraNode = SKCameraNode()
    let cameraMovePointPerSec: CGFloat = 200.0
    var cameraRect: CGRect {
        let x = cameraNode.position.x - size.width / 2 + (size.width - playableRect.width) / 2
        let y = cameraNode.position.y - size.height / 2 + (size.height - playableRect.height) / 2
        
        return CGRect(x: x, y: y, width: playableRect.width, height:
            playableRect.height)
    }
    
    while(enemyAlive = true) {
    
        let characterOfMain = 0
        let partyMember2 = 1
        let girlWithHair = 2
        let enemy 1 = 3
        let enemy 2 = 4
        let enemy 3 = 5
    
        var charMain: MainCharacter!
        var partyMember2: SecondCharacter!
        var girl: Girl!
    
        var enemy1: Enemy1!
        var enemy2: Enemy2!
        var enemy3: Enemy3!
    
        switch playerTurn {

            case 0:
            player.attack()
            playerTurn += 1
            case 1:
            player.magicAttack()
            playerTurn += 1

            case 2:
            escape()
            }

        if enemyTurn{
        attack()
    let wait = SKAction.wait(forDuration: 2)
    
        playerTurn +=1
        }
    
    
    }
    
}



 
