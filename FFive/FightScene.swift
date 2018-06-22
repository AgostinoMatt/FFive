//
//  FightScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-20.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit

protocol InteractiveNode {
    func interact()
}

protocol EventListenerNode {
    func didMoveToScene()
}

class FightScene: SKScene {
    var MainChar: SKSpriteNode!
    var Second: SKSpriteNode!
    var girl: SKReferenceNode!
    var MainSword: SKSpriteNode!
    var SecondSword: SKSpriteNode!
    
    var enemies: [SKReferenceNode] = []
    var playerTurn: Bool = true
    var enemyAlive = true
    
    
    override func didMove(to view: SKView) {
        
        MainChar = SKSpriteNode(imageNamed: "hero10")
        MainChar.position = CGPoint(x: (size.width / 4) * 3 , y: size.width / 3)
        MainChar.zPosition = 20
        MainChar.name = "Main"
        addChild(MainChar)
        
        MainSword = SKSpriteNode(imageNamed: "sword1")
        MainSword.position = CGPoint(x: MainChar.position.x - 11, y: MainChar.position.y - 7)
        MainSword.zPosition = 10
        MainSword.name = "mainSword"
        addChild(MainSword)
        
        Second = SKSpriteNode(imageNamed: "greyFight")
        Second.position = CGPoint(x: (size.width / 4) * 3 + 50 , y: size.width / 2)
        Second.zPosition = 10
        Second.name = "second"
        addChild(Second)
        
        SecondSword = SKSpriteNode(imageNamed: "buster")
        SecondSword.position = CGPoint(x: Second.position.x , y: Second.position.y)
        SecondSword.zPosition = 20
        SecondSword.name = "secondSword"
        addChild(SecondSword)
        
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
        //charMain.isPaused = false
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        if playerTurn {
            playerFight()
            //print(charMain.hasActions())
        }
        else {
            enemyFight()
            print("enemies")
        }
    }
    
    func playerFight(){
       
    }
    
    func enemyFight() {
        
    }
    
    func MainCharAnim() {
        let moveForward = SKAction.moveBy(x: -30, y: 0, duration: 0.25)
        let moveBack = SKAction.moveBy(x: 30, y: 0, duration: 0.75)
        MainChar.run(SKAction.sequence([moveForward, moveBack]))
        MainCharSword()
    }
    
    func MainCharSword(){
        let rotateForward = SKAction.rotate(byAngle: CGFloat(450).degreesToRadians(), duration: 0.5)
        let rotateBack = rotateForward.reversed()
        MainSword.run(SKAction.sequence([rotateForward, rotateBack]))
    }
    
    func SecondPlayerAnim() {
        let moveForward = SKAction.moveBy(x: -40, y: 0, duration: 0.4)
        let wait = SKAction.wait(forDuration: 0.2)
        let moveBack = SKAction.moveBy(x: -40, y: 0, duration: 0.6)
        Second.run(SKAction.sequence([moveForward, wait, moveBack]))
    }
    
    func SecondWeapond(){
        run(SKAction.rotate(byAngle: CGFloat(720).degreesToRadians(), duration: 1))
    }
    
    
    /*func spawnEnemy() {
        let cameraSpace = cameraRect
        let enemy = SKSpriteNode(imageNamed: "enemy")
        enemy.position = CGPoint(
            x: cameraSpace.maxX + enemy.size.width / 2,
            y: CGFloat.random(
                min: cameraSpace.minY + enemy.size.height / 2,
                max: cameraSpace.maxY - enemy.size.height / 2))
        enemy.zPosition = 1
        enemy.name = "enemy"
        addChild(enemy)
        
        let actionMove = SKAction.moveBy(x: -(size.width + enemy.size.width), y: 0, duration: 2.5)
        let actionRemove = SKAction.removeFromParent()
        enemy.run(SKAction.sequence([actionMove, actionRemove]))
    }*/
}



 
