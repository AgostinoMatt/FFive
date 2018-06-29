//
//  Character.swift
//  FFive
//
//  Created by Jeff Gauvin on 2018-06-22.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit

protocol Character {
    var level: Int{ get set }
    var attack: Int { get set }
    var health: Int { get set }
    var maxHealth: Int { get set }
    var magic: Int { get set }
    var exp: Int { get set }
    func runAnimation()
}


class Warrior : SKSpriteNode, Character {
    var level: Int = 1
    var attack: Int = 10
    var health: Int = 120
    var maxHealth: Int = 120
    var magic: Int = 10
    var exp: Int = 0
    
    func levelUp() {
        if exp >= 200{
            level += 1
            attack += (level * 2)
            health += (level * 5)
            maxHealth += (level * 5)
            magic += (level * 2)
            exp -= 200
        }
    }
    
    
    func runAnimation() {
        let moveLeft = SKAction.moveBy(x: -30, y: 0, duration: 0.25)
        let moveRight = moveLeft.reversed()
        let rotate = SKAction.rotate(byAngle: 2*π, duration: 0.25)
        let wait = SKAction.wait(forDuration: 0.25)
        let done = SKAction.run() {
            self.removeAllActions()
        }
        run(SKAction.sequence([moveLeft, wait, moveRight, done]))
        if let item = childNode(withName: "item") as? SKSpriteNode {
            item.run(SKAction.sequence([wait, rotate]))
        }
        isPaused = false
    }
}

class Mage : SKSpriteNode, Character {
    var level: Int = 1
    var attack: Int = 5
    var health: Int = 100
    var maxHealth: Int = 100
    var magic: Int = 15
    var exp: Int = 0
    
    func levelUp() {
        if exp >= 200{
            level += 1
            attack += (level * 1)
            health += (level * 5)
            maxHealth += (level * 5)
            magic += (level * 3)
            exp -= 200
        }
    }
    
    func runAnimation() {
        let moveUp = SKAction.moveBy(x: 50, y: 40, duration: 0.5)
        let moveDown = moveUp.reversed()
        let rotateUp = SKAction.rotate(toAngle: CGFloat(145).degreesToRadians(), duration: 0.5)
        let rotateDown = SKAction.rotate(byAngle: CGFloat(-90).degreesToRadians(), duration: 0.5)
        let wait = SKAction.wait(forDuration: 0.5)
        let done = SKAction.run() {
            self.removeAllActions()
        }
        
        if let item = childNode(withName: "item") as? SKSpriteNode {
            item.run(
                SKAction.sequence(
                    [SKAction.group([moveUp, rotateUp]),
                     wait,
                     SKAction.group([moveDown, rotateDown]),
                     done]
                )
            )
        }
        isPaused = false
    }
}

class Heavy: SKSpriteNode, Character {
    var level: Int = 1
    var attack: Int = 15
    var health: Int = 110
    var maxHealth: Int = 110
    var magic: Int = 5
    var exp: Int = 0
    
    func levelUp() {
        if exp >= 200{
            level += 1
            attack += (level * 3)
            health += (level * 5)
            maxHealth += (level * 5)
            magic += (level * 1)
            exp -= 200
        }
    }
    
    func runAnimation() {
        let moveLeft = SKAction.moveBy(x: -40, y: 0, duration: 0.4)
        let moveRight = SKAction.moveBy(x: 40, y: 0, duration: 0.6)
        let wait = SKAction.wait(forDuration: 0.2)
        let done = SKAction.run() {
            self.removeAllActions()
        }
        run(SKAction.sequence([moveLeft, wait, moveRight, done]))
        if let item = childNode(withName: "item") as? SKSpriteNode {
            item.run(SKAction.rotate(byAngle: 720, duration: 1))
        }
        isPaused = false
    }
    
}

class Zombie: SKSpriteNode, Character {
    var level: Int = 1
    var attack: Int = 5
    var health: Int = 50
    var maxHealth: Int = 50
    var magic: Int = 0
    var exp: Int = 30
    
    func runAnimation() {
        let moveRight = SKAction.moveBy(x: 30, y: 20, duration: 0.5)
        let moveLeft = moveRight.reversed()
        let spin = SKAction.rotate(byAngle: 720, duration: 1)
        let spinBack = spin.reversed()
        let done = SKAction.run() {
            self.removeAllActions()
        }
        run(SKAction.sequence(
            [SKAction.group([moveRight, spin]),
             SKAction.group([moveLeft, spinBack]),
             done]))
        isPaused = false
        
    }
}

class Headless: SKSpriteNode, Character {
    var level: Int = 1
    var attack: Int = 10
    var health: Int = 40
    var maxHealth: Int = 40
    var magic: Int = 0
    var exp: Int = 30
    
    var textures: [SKTexture] = []
    //var textures2: [SKTexture] = []
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        for i in 1...7 {
            textures.append(SKTexture(imageNamed: "head\(i)"))
        }
        textures.append(textures[1])
        
        /*for j in 5...7 {
         textures2.append(SKTexture(imageNamed: "head\(j)"))
         }
         textures2.append(textures[1])*/
        
    }
    
    func runAnimation() {
        let moveRight = SKAction.moveBy(x: 60, y: 0, duration: 1)
        let moveLeft = moveRight.reversed()
        //let wait = SKAction.wait(forDuration: 0.3)
        //let animateForward = SKAction.group([SKAction.animate(with: textures, timePerFrame: 0.5), moveRight])
        //let animateBack = animateForward.reversed()
        //let animateBack = SKAction.group([SKAction.animate(with: textures2, timePerFrame: 0.5), moveLeft])
        let done = SKAction.run() {
            self.removeAllActions()
        }
        //run(SKAction.sequence(animateForward, animateBack ,done))
        run(SKAction.sequence([SKAction.group([SKAction.animate(with: textures, timePerFrame: 0.5),moveRight]),moveLeft,done]))
        isPaused = false
    }
}


class Nexit: SKSpriteNode, Character {
    var level: Int = 1
    var attack: Int = 40
    var health: Int = 400
    var maxHealth: Int = 400
    var magic: Int = 0
    var exp: Int = 1000
    
    func runAnimation() {
        let moveRight = SKAction.moveBy(x: 100, y: 0, duration: 1)
    }
    
    
}







