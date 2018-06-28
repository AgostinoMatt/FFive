//
//  FightScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-20.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit

class FightScene: SKScene {
    
    // Variables
    var charMain: Warrior!
    var charMage: Mage!
    var charHeavy: Heavy!
    var enemy1: Zombie!
    var enemy2: Headless!
    var enemy3: Zombie!
    var secondCharacter: SKReferenceNode!
    var girl: SKReferenceNode!
    
    var enemies: [SKReferenceNode] = []
    var playerTurn: Bool = true
    var canAttack: Bool = true
    var enemyAlive = true
    var playerNumber = 1
    
    
    
    override func didMove(to view: SKView) {
        
        //playBackgroundMusic(filename: "MortalKombat.mp3")
        let charMainLabel = SKLabelNode(fontNamed: "Upheaval")
        let charMageLabel = SKLabelNode(fontNamed: "Upheaval")
        let charHeavyLabel = SKLabelNode(fontNamed: "Upheaval")
        
        charMain = childNode(withName: "MainCharacter//character") as! Warrior
        charMage = childNode(withName: "Girl//character") as! Mage
        charHeavy = childNode(withName: "SecondPlayer//character") as! Heavy
        enemy1 = childNode(withName: "Enemy1//character") as! Zombie
        enemy2 = childNode(withName: "Enemy2//character") as! Headless
        enemy3 = childNode(withName: "Enemy3//character") as! Zombie
        
        enumerateChildNodes(withName: "//Enemy*") { node, _ in
            if let enemy = node as? SKReferenceNode {
                self.enemies.append(enemy)
            }
        }
        
        charMainLabel.text = "Health: X"
        charMainLabel.fontColor = SKColor.black
        charMainLabel.fontSize = 30
        charMainLabel.zPosition = 100
        charMainLabel.position = CGPoint(x: 300, y: 250)
        //healthLabel.horizontalAlignmentMode = .left
        //healthLabel.verticalAlignmentMode = .bottom
        
        self.addChild(charMainLabel)
        self.addChild(charMageLabel)
        self.addChild(charHeavyLabel)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if playerTurn {
            playerTurn = false
        }
        else {
            enemyFight()
        }
    }
    
    func increment() {
        print("before increment \(playerNumber)")
        playerNumber += 1
        if playerNumber <= 3 {
            canAttack = true
        }
        
        if playerNumber == 7 {
            playerNumber = 0
        }
        print("incrementing playerNumber \(playerNumber)")
        
    }
    
    
    func attack() {
        
        var selectedEnemy: Character!
        
        repeat {
            let attackNum = Int.random(1...4)
            selectedEnemy = pickEnemy(attackNum)
        }while(selectedEnemy!.health <= 0)
        
        if playerNumber == 1 {
            selectedEnemy.health -= charMain.attack
        }
            
        else if playerNumber == 2 {
            
            selectedEnemy.health -= charMage.attack
        }
        else if playerNumber == 3 {
            
            selectedEnemy.health -= charHeavy.attack
        }
        
       if selectedEnemy.health < 0{
            selectedEnemy.health = 0
        }
        print("zombie: \(enemy1.health)")
        print("Headless: \(enemy2.health)")
        print("Zombie: \(enemy3.health)")
    }
    
    func magic() {
        var selectedEnemy: Character!
        
        repeat {
            let attackNum = Int.random(1...4)
            selectedEnemy = pickEnemy(attackNum)
        }while(selectedEnemy!.health <= 0)
        
        if playerNumber == 1 {
            selectedEnemy.health -= charMain.magic
            
        }
        else if playerNumber == 2 {
            
            selectedEnemy.health -= charMage.magic
        }
        else if playerNumber == 3 {
            
            selectedEnemy.health -= charHeavy.magic
        }
        
        if selectedEnemy.health < 0{
            selectedEnemy.health = 0
        }
        
        print("zombie: \(enemy1.health)")
        print("Headless: \(enemy2.health)")
        print("Zombie: \(enemy3.health)")
    }
    
    func playerFight(){
        
        //if the playerNumber is equal to 1, run character Of Main actions & animations. Increase playerNumber by 1
        if playerNumber == 1{
            if !charMain.hasActions() {
                charMain.runAnimation()
                run(SKAction.afterDelay(2, runBlock: increment))
            }
        }
            
            //if the playerNumber is equal to 2, run the Girl With Hair actions & animations. Increase playerNumber by 1
        else if playerNumber == 2 {
            if !charMage.hasActions(){
                charMage.runAnimation()
                //print(playerNumber)
                //  playerNumber += 1
                run(SKAction.afterDelay(2, runBlock: increment))
                
            }
        }
            //if the playerNumber is equal to 3, run the Party Member # 2 actions & animations. Increase playerNumber by 1
        else if playerNumber == 3 {
            if !charHeavy.hasActions(){
                charHeavy.runAnimation()
                run(SKAction.afterDelay(2, runBlock: increment))
                
                // print(playerNumber)
                
                // playerNumber += 1
            }
        }
        
        print("players")
    }
    
    // enemyFight method to make enemies randomly attack the player's party members
    func enemyFight() {
        let attackNum = Int.random(0...4) //attackNum set to a random integer
        
        //if statement to determine which enemy is attacking and if they have actions run those actions & animations
        if playerNumber == 4 {
            if !enemy1.hasActions(){
                enemy1.runAnimation()
                if attackNum == 1 {
                    charMain.health = charMain.health - enemy1.attack
                }
                else if attackNum == 2 {
                    charMage.health = charMage.health - enemy1.attack
                }
                else if attackNum == 3 {
                    charHeavy.health = charHeavy.health - enemy1.attack
                }
                run(SKAction.afterDelay(3, runBlock: increment))            }
        }
            //enemy2 actions & animations
        else if playerNumber == 5 {
            if !enemy2.hasActions(){
                enemy2.runAnimation()
                if attackNum == 1 {
                    charMain.health = charMain.health - enemy1.attack
                }
                else if attackNum == 2 {
                    charMage.health = charMage.health - enemy1.attack
                }
                else if attackNum == 3 {
                    charHeavy.health = charHeavy.health - enemy1.attack
                }
                run(SKAction.afterDelay(3, runBlock: increment))            }
        }
            //enemy3 actions & animations
        else if playerNumber == 6 {
            if !enemy3.hasActions(){
                enemy3.runAnimation()
                if attackNum == 1 {
                    charMain.health = charMain.health - enemy1.attack
                }
                else if attackNum == 2 {
                    charMage.health = charMage.health - enemy1.attack
                }
                else if attackNum == 3 {
                    charHeavy.health = charHeavy.health - enemy1.attack
                }
                run(SKAction.afterDelay(3, runBlock: increment))            }
        }
    }
    
    func pickEnemy(_ enemy: Int) -> Character?{
        switch enemy {
        case 1:
            return enemy1
        case 2:
            return enemy2
        case 3:
            return enemy3
        default:
            return nil
        }
    }
}




