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
    var sceneDone: Bool = false
    
    let charMainLabel = SKLabelNode()
    let charMageLabel = SKLabelNode()
    let charHeavyLabel = SKLabelNode()
    let enemy1Label = SKLabelNode()
    let enemy2Label = SKLabelNode()
    let enemy3Label = SKLabelNode()
    
    override func didMove(to view: SKView) {
        
        //playBackgroundMusic(filename: "MortalKombat.mp3")
        
        
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
        
        charMainLabel.text = "HP: "//\(charMain.maxHealth)/ \(charMain.health)"
        charMainLabel.fontColor = SKColor.black
        charMainLabel.fontSize = 20
        charMainLabel.zPosition = 100
        charMainLabel.position = CGPoint(x: 375, y: -100)
        
        charMageLabel.text = "HP: "//\(charMage.maxHealth)/ \(charMage.health)"
        charMageLabel.fontColor = SKColor.black
        charMageLabel.fontSize = 20
        charMageLabel.zPosition = 100
        charMageLabel.position = CGPoint(x: 375, y: 200)
        
        charHeavyLabel.text = "HP: "//\(charHeavy.maxHealth)/ \(charHeavy.health)"
        charHeavyLabel.fontColor = SKColor.black
        charHeavyLabel.fontSize = 20
        charHeavyLabel.zPosition = 100
        charHeavyLabel.position = CGPoint(x: 375, y: 50)
        
        enemy1Label.text = "HP: "//\(enemy1.maxHealth)/ \(enemy1.health)"
        enemy1Label.fontColor = SKColor.black
        enemy1Label.fontSize = 20
        enemy1Label.zPosition = 100
        enemy1Label.position = CGPoint(x: -400, y: -100)
        
        enemy2Label.text = "HP: "//\(enemy2.maxHealth)/ \(enemy2.health)"
        enemy2Label.fontColor = SKColor.black
        enemy2Label.fontSize = 20
        enemy2Label.zPosition = 100
        enemy2Label.position = CGPoint(x: -400, y: 50)
        
        enemy3Label.text = "HP: "//\(enemy3.maxHealth)/ \(enemy3.health)"
        enemy3Label.fontColor = SKColor.black
        enemy3Label.fontSize = 20
        enemy3Label.zPosition = 100
        enemy3Label.position = CGPoint(x: -400, y: 200)
        
        self.addChild(charMainLabel)
        self.addChild(charMageLabel)
        self.addChild(charHeavyLabel)
        self.addChild(enemy1Label)
        self.addChild(enemy2Label)
        self.addChild(enemy3Label)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if playerTurn {
            playerTurn = false
        }
        else {
            enemyFight()
        }
        
        charMainLabel.text = "HP: \(charMain.health) / \(charMain.maxHealth)"
        charMageLabel.text = "HP: \(charMage.health) / \(charMage.maxHealth)"
        charHeavyLabel.text = "HP: \(charHeavy.health) / \(charHeavy.maxHealth)"
        
        enemy1Label.text = "HP: \(enemy1.health) / \(enemy1.maxHealth)"
        enemy2Label.text = "HP: \(enemy2.health) / \(enemy2.maxHealth)"
        enemy3Label.text = "HP: \(enemy3.health) / \(enemy3.maxHealth)"
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
        
        if selectedEnemy.health <= 0{
            selectedEnemy.health = 0
            if let enemy = selectedEnemy as? SKSpriteNode{
                enemy.run(SKAction.hide())
            }
            if enemy1.health == 0 && enemy2.health == 0 && enemy3.health == 0 {
                win()
            }
            else if charMain.health == 0 && charMage.health == 0 && charHeavy.health == 0 {
                lose()
            }
        }
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
        
        if selectedEnemy.health <= 0{
            selectedEnemy.health = 0
            if let enemy = selectedEnemy as? SKSpriteNode{
                enemy.run(SKAction.hide())
            }
            if enemy1.health == 0 && enemy2.health == 0 && enemy3.health == 0 {
                win()
                print("win")
            }
            else if charMain.health == 0 && charMage.health == 0 && charHeavy.health == 0 {
                lose()
            }
        }
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
            }
        }
        
        //print("players")
    }
    
    // enemyFight method to make enemies randomly attack the player's party members
    func enemyFight() {
        let attackNum = Int.random(0...4) //attackNum set to a random integer
        
        //if statement to determine which enemy is attacking and if they have actions run those actions & animations
        if playerNumber == 4 {
            
            if enemy1.health <= 0 {
                increment()
            }
            else{
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
                    run(SKAction.afterDelay(3, runBlock: increment))
                }
            }
        }
            //enemy2 actions & animations
        else if playerNumber == 5 {
            
            if enemy2.health <= 0 {
                increment()
            }
            else{
                
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
                    run(SKAction.afterDelay(3, runBlock: increment))
                }
            }
        }
            //enemy3 actions & animations
        else if playerNumber == 6 {
            
            if enemy3.health <= 0 {
                increment()
            }
            else{
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
                    run(SKAction.afterDelay(3, runBlock: increment))
                }
            }
        }
    }
    
    
    
    func win() {
        charMain.exp += (enemy1.exp + enemy2.exp + enemy3.exp)
        charMage.exp += (enemy1.exp + enemy2.exp + enemy3.exp)
        charHeavy.exp += (enemy1.exp + enemy2.exp + enemy3.exp)
        print(" char exp \(charMain.exp) ")
        sceneDone = true
        
        if let navController = self.view!.window!.rootViewController as? UINavigationController {
            navController.popViewController(animated: true)
            print("leaving")
        }
    }
    
    func lose() {
        sceneDone = true
        if let navController = self.view!.window!.rootViewController as? UINavigationController{
            navController.popViewController(animated: true)
        }
    }
}




