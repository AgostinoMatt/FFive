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
    var enemySprite1: SKSpriteNode!
    var enemySprite2: SKSpriteNode!
    var enemySprite3: SKSpriteNode!
    
    var e1: Character!
    var e2: Character!
    var e3: Character!
    
    var zombie: Zombie!
    var headless: Headless!
    //var secondCharacter: SKReferenceNode!
    //var girl: SKReferenceNode!
    
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
        
        randomEnemy()
        
        enemySprite1 = childNode(withName: "Enemy1//character") as! SKSpriteNode
        enemySprite2 = childNode(withName: "Enemy2//character") as! SKSpriteNode
        enemySprite3 = childNode(withName: "Enemy3//character") as! SKSpriteNode
        
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
        
        charMainLabel.text = "HP: \(Warrior.shared.health) / \(Warrior.shared.maxHealth)"
        charMageLabel.text = "HP: \(Mage.shared.health) / \(Mage.shared.maxHealth)"
        charHeavyLabel.text = "HP: \(Heavy.shared.health) / \(Heavy.shared.maxHealth)"
        
        enemy1Label.text = "HP: \(e1.health) / \(e1.maxHealth)"
        enemy2Label.text = "HP: \(e2.health) / \(e2.maxHealth)"
        enemy3Label.text = "HP: \(e3.health) / \(e3.maxHealth)"
    }
    
    func randomEnemy(){
        var randEnemy = Int.random(1...3)
        var enemy1: SKReferenceNode
        var enemy2: SKReferenceNode
        var enemy3: SKReferenceNode
        
        if randEnemy == 1 {
            enemy1 = SKReferenceNode(fileNamed: "ZombieFight")
        }
        else {
            enemy1 = SKReferenceNode(fileNamed: "HeadlessFight")
        }
        enemy1.name = "Enemy1"
        
        randEnemy = Int.random(1...3)
        if randEnemy == 1 {
            enemy2 = SKReferenceNode(fileNamed: "ZombieFight")
            
        }
        else {
            enemy2 = SKReferenceNode(fileNamed: "HeadlessFight")
        }
        enemy2.name = "Enemy2"
        
        
        randEnemy = Int.random(1...3)
        if randEnemy == 1 {
            enemy3 = SKReferenceNode(fileNamed: "ZombieFight")
        }
        else {
            enemy3 = SKReferenceNode(fileNamed: "HeadlessFight")
        }
        enemy3.name = "Enemy3"
        
        e1 = enemySprite1 as! Character
        e2 = enemySprite2 as! Character
        e3 = enemySprite3 as! Character
        
        e1.levelUp()
        e2.levelUp()
        e3.levelUp()
        
        addChild(enemy1)
        addChild(enemy2)
        addChild(enemy3)
    }
    
    func pickEnemy(_ enemy: Int) -> Character?{
        switch enemy {
        case 1:
            return e1
        case 2:
            return e2
        case 3:
            return e3
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
        if playerNumber == 1 && Warrior.shared.health <= 0 {
            increment()
        }
        if playerNumber == 2 && Mage.shared.health <= 0 {
            increment()
        }
        if playerNumber == 3 && Heavy.shared.health <= 0 {
            increment()
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
            /*if Warrior.shared.health <= 0 {
             increment()
             }
             else {*/
            selectedEnemy.health -= Warrior.shared.attack
            print("attack")
            //}
        }
        
        if playerNumber == 2{
            /*if Mage.shared.health <= 0 {
             increment()
             }
             else {*/
            selectedEnemy.health -= Mage.shared.attack
            //}
        }
        if playerNumber == 3{
            /*if Heavy.shared.health <= 0 {
             increment()
             }
             else{*/
            selectedEnemy.health -= Heavy.shared.attack
            //}
        }
        
        if selectedEnemy.health <= 0{
            selectedEnemy.health = 0
            if let enemy = selectedEnemy as? SKSpriteNode{
                enemy.run(SKAction.hide())
            }
            
        }
        
        if e1.health == 0 && e2.health == 0 && e3.health == 0 {
            run(SKAction.afterDelay(4, runBlock: win))
        }
    }
    
    func magic() {
        var selectedEnemy: Character!
        
        repeat {
            let attackNum = Int.random(1...4)
            selectedEnemy = pickEnemy(attackNum)
        }while(selectedEnemy!.health <= 0)
        
        if playerNumber == 1 {
            /*if Warrior.shared.health <= 0 {
             increment()
             }
             else {*/
            selectedEnemy.health -= Warrior.shared.magic
            //}
        }
        if playerNumber == 2 {
            /*if Mage.shared.health <= 0 {
             increment()
             }
             else {*/
            selectedEnemy.health -= Mage.shared.magic
            //}
        }
        if playerNumber == 3 {
            /*if Heavy.shared.health <= 0 {
             increment()
             }
             else {*/
            selectedEnemy.health -= Heavy.shared.magic
            //}
        }
        
        if selectedEnemy.health <= 0{
            selectedEnemy.health = 0
            if let enemy = selectedEnemy as? SKSpriteNode{
                enemy.run(SKAction.hide())
            }
        }
        
        if e1.health == 0 && e2.health == 0 && e3.health == 0 {
            run(SKAction.afterDelay(4, runBlock: win))
        }
    }
    
    func playerFight(){
        
        //if the playerNumber is equal to 1, run character Of Main actions & animations. Increase playerNumber by 1
        if playerNumber == 1{
            if !charMain.hasActions() {
                charMain.runAnimation()
                run(SKAction.afterDelay(3, runBlock: increment))
                print("main")
            }
        }
            
            //if the playerNumber is equal to 2, run the Girl With Hair actions & animations. Increase playerNumber by 1
        else if playerNumber == 2 {
            if !charMage.hasActions(){
                charMage.runAnimation()
                run(SKAction.afterDelay(3, runBlock: increment))
                print("mage")
            }
        }
            
            //if the playerNumber is equal to 3, run the Party Member # 2 actions & animations. Increase playerNumber by 1
        else if playerNumber == 3 {
            if !charHeavy.hasActions(){
                charHeavy.runAnimation()
                run(SKAction.afterDelay(3, runBlock: increment))
                print("heavy")
            }
        }
    }
    
    // enemyFight method to make enemies randomly attack the player's party members
    func enemyFight() {
        var attackNum = Int.random(1...4) //attackNum set to a random integer
        if attackNum == 1 && Warrior.shared.health <= 0 {
            attackNum += 1
        }
        if attackNum == 2 && Mage.shared.health <= 0 {
            attackNum += 1
        }
        if attackNum == 3 && Heavy.shared.health <= 0 {
            attackNum = 1
        }
        //if statement to determine which enemy is attacking and if they have actions run those actions & animations
        if playerNumber == 4 {
            
            if e1.health <= 0 {
                increment()
            }
            else{
                if !enemySprite1.hasActions(){
                    e1.runAnimation()
                    if attackNum == 1 {
                        Warrior.shared.health = Warrior.shared.health - e1.attack
                    }
                    else if attackNum == 2 {
                        Mage.shared.health = Mage.shared.health - e1.attack
                    }
                    else if attackNum == 3 {
                        Heavy.shared.health = Heavy.shared.health - e1.attack
                    }
                    run(SKAction.afterDelay(3, runBlock: increment))
                }
            }
        }
        //enemy2 actions & animations
        if playerNumber == 5 {
            
            if e2.health <= 0 {
                increment()
            }
            else{
                if !enemySprite2.hasActions(){
                    e2.runAnimation()
                    if attackNum == 1 {
                        Warrior.shared.health = Warrior.shared.health - e2.attack
                    }
                    else if attackNum == 2 {
                        Mage.shared.health = Mage.shared.health - e2.attack
                    }
                    else if attackNum == 3 {
                        Heavy.shared.health = Heavy.shared.health - e2.attack
                    }
                    run(SKAction.afterDelay(3, runBlock: increment))
                }
            }
        }
        //enemy3 actions & animations
        if playerNumber == 6 {
            
            if e3.health <= 0 {
                increment()
            }
            else{
                if !enemySprite3.hasActions(){
                    e3.runAnimation()
                    if attackNum == 1 {
                        Warrior.shared.health = Warrior.shared.health - e3.attack
                    }
                    else if attackNum == 2 {
                        Mage.shared.health =  Mage.shared.health - e3.attack
                    }
                    else if attackNum == 3 {
                        Heavy.shared.health = Heavy.shared.health - e3.attack
                    }
                    run(SKAction.afterDelay(3, runBlock: increment))
                }
            }
        }
        if Warrior.shared.health < 0{
            Warrior.shared.health = 0
        }
        if Mage.shared.health < 0 {
            Mage.shared.health = 0
        }
        if Heavy.shared.health < 0 {
            Heavy.shared.health = 0
        }
        if Warrior.shared.health == 0 && Mage.shared.health == 0 && Heavy.shared.health == 0 {
            run(SKAction.afterDelay(4, runBlock: lose))
        }
    }
    
    
    
    func win() {
        Warrior.shared.exp += (e1.exp + e2.exp + e3.exp)
        Mage.shared.exp += (e1.exp + e2.exp + e3.exp)
        Heavy.shared.exp += (e1.exp + e2.exp + e3.exp)
        //print(" char exp \(charMain.exp) ")
        Warrior.shared.levelUp()
        Mage.shared.levelUp()
        Heavy.shared.levelUp()
        Warrior.shared.health = Warrior.shared.maxHealth
        Mage.shared.health = Mage.shared.maxHealth
        Heavy.shared.health = Heavy.shared.maxHealth
        sceneDone = true
        
        if let navController = self.view!.window!.rootViewController as? UINavigationController {
            navController.popViewController(animated: true)
            print("leaving")
        }
    }
    
    func lose() {
        Warrior.shared.health = Warrior.shared.maxHealth
        Mage.shared.health = Mage.shared.maxHealth
        Heavy.shared.health = Heavy.shared.maxHealth
        sceneDone = true
        if let navController = self.view!.window!.rootViewController as? UINavigationController{
            navController.popViewController(animated: true)
        }
    }
}




