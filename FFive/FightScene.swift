//
//  FightScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-20.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit
import UIKit

protocol InteractiveNode {
    func interact()
}

protocol EventListenerNode {
    func didMoveToScene()
}

class FightScene: SKScene {
    var charMain: SKSpriteNode!
    var secondCharacter: SKReferenceNode!
    var girl: SKReferenceNode!
    
    var enemies: [SKReferenceNode] = []
    var playerTurn: Bool = true
    var enemyAlive = true
    
    override func didMove(to view: SKView) {
        
        charMain = childNode(withName: ".//MainCharacter/character") as! SKSpriteNode
        
        isPaused = true
        isPaused = false
        
        enumerateChildNodes(withName: "//*") { node, _ in
            if let char = node as? SKReferenceNode {
                char.isPaused = true
            }
        }
        
        enumerateChildNodes(withName: "//Enemy*") { node, _ in
            if let enemy = node as? SKReferenceNode {
                self.enemies.append(enemy)
            }
        }
        
        charMain.isPaused = false
        
    
    
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        if playerTurn {
            playerFight()
            print(charMain.hasActions())
        }
        else {
            enemyFight()
            print("enemies")
        }
    }
    
    func playerFight(){
        if !charMain.hasActions() {
            playerTurn = false
            enemies[0].isPaused = false
        }
    }
    
    func enemyFight() {
        if !enemies[0].hasActions() {
            charMain.isPaused = false
            playerTurn = true
        }
    }
    
}



 
