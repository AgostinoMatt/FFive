//
//  NexitScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-27.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit


class NexitScene: SKScene {
    
    
    // Variables
    var charMain: Warrior!
    var charMage: Mage!
    var charHeavy: Heavy!
    var charNexit: Nexit!
    var enemyAlive = true
    var playerNumber = 1
    var playerTurn: Bool = true
    var sceneDone: Bool = false
    var canAttack: Bool = true
    
    let charMainLabel = SKLabelNode()
    let charMageLabel = SKLabelNode()
    let charHeavyLabel = SKLabelNode()
    let NexitLabel = SKLabelNode()
    
    override func didMove(to view: SKView) {
        
        charMain = childNode(withName: "MainCharacter//character") as! Warrior
        charMage = childNode(withName: "Girl//character") as! Mage
        charHeavy = childNode(withName: "SecondPlayer//character") as! Heavy
        charNexit = childNode(withName: "Nexit//character") as! Nexit
        
        charMainLabel.text = "HP: "//\(charMain.maxHealth)/ \(charMain.health)"
        charMainLabel.fontColor = SKColor.black
        charMainLabel.fontSize = 20
        charMainLabel.zPosition = 100
        charMainLabel.position = CGPoint(x: 375, y: -100)
        //healthLabel.horizontalAlignmentMode = .left
        //healthLabel.verticalAlignmentMode = .bottom
        
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
        
        NexitLabel.text = "HP: "//\(charMain.maxHealth)/ \(charMain.health)"
        NexitLabel.fontColor = SKColor.black
        NexitLabel.fontSize = 20
        NexitLabel.zPosition = 100
        NexitLabel.position = CGPoint(x: -400, y: 50)
        
        self.addChild(charMainLabel)
        self.addChild(charMageLabel)
        self.addChild(charHeavyLabel)
        self.addChild(NexitLabel)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if playerNumber <= 4{
            nexitFight()
        }
        
        charMainLabel.text = "HP: \(Warrior.shared.health) / \(Warrior.shared.maxHealth)"
        charMageLabel.text = "HP: \(Mage.shared.health) / \(Mage.shared.maxHealth)"
        charHeavyLabel.text = "HP: \(Heavy.shared.health) / \(Heavy.shared.maxHealth)"
        
        NexitLabel.text = "HP: \(charNexit.health) / \(charNexit.maxHealth)"
    }
    
    func increment() {
        //print(playerNumber)
        playerNumber += 1
        if playerNumber <= 3 {
            canAttack = true
        }
        if playerNumber == 5 {
            playerNumber = 0
        }
        //print(playerNumber)
        //print("incrementing playerNumber")
    }
    func attack() {
        if playerNumber == 1 {
            if Warrior.shared.health <= 0{
                playerNumber += 1
            }
            else{
            charNexit.health = charNexit.health - Warrior.shared.attack
            }
        }
        if playerNumber == 2 {
            if Mage.shared.health <= 0{
                playerNumber += 1
            }
            else{
            charNexit.health = charNexit.health - Mage.shared.attack
            }
        }
        if playerNumber == 3 {
            if Heavy.shared.health <= 0{
                playerNumber += 1
            }
            else{
            charNexit.health = charNexit.health - Heavy.shared.attack
            }
        }
        if charNexit.health <= 0{
            charNexit.health = 0
            win()
        }
    }
    
    func magic() {
        if playerNumber == 1 {
            if Warrior.shared.health <= 0{
                playerNumber += 1
            }
            else{
            charNexit.health = charNexit.health - Warrior.shared.magic
            }
        }
        if playerNumber == 2 {
            if Mage.shared.health <= 0{
                playerNumber += 1
            }
            else{
            charNexit.health = charNexit.health - Mage.shared.magic
            }
        }
        if playerNumber == 3 {
            if Heavy.shared.health <= 0{
                playerNumber += 1
            }
            else{
            charNexit.health = charNexit.health - Heavy.shared.magic
            }
        }
        if charNexit.health <= 0{
            charNexit.health = 0
            win()
        }
    }
    
    func playerFight(){
        
        //if the playerNumber is equal to 1, run character Of Main actions & animations. Increase playerNumber by 1
        if playerNumber == 1{
            if !charMain.hasActions() {
                charMain.runAnimation()
                print(playerNumber)
                run(SKAction.afterDelay(2, runBlock: increment))
            }
        }
            
            //if the playerNumber is equal to 2, run the Girl With Hair actions & animations. Increase playerNumber by 1
        if playerNumber == 2 {
            if !charMage.hasActions(){
                charMage.runAnimation()
                print(playerNumber)
                run(SKAction.afterDelay(2, runBlock: increment))
            }
        }
            //if the playerNumber is equal to 3, run the Party Member # 2 actions & animations. Increase playerNumber by 1
        if playerNumber == 3 {
            if !charHeavy.hasActions(){
                charHeavy.runAnimation()
                print(playerNumber)
                run(SKAction.afterDelay(2, runBlock: increment))
            }
        }
        print("players")
    }
    
    func nexitFight() {
        var attackNum = Int.random(1...3) //attackNum set to a random integer
        
        
        if playerNumber == 4 {
            if !charNexit.hasActions(){
                charNexit.runAnimation()
                if attackNum == 1 {
                    if Warrior.shared.health <= 0 {
                        attackNum = 2
                    }
                    else{
                        Warrior.shared.health = Warrior.shared.health - charNexit.attack
                        if Warrior.shared.health < 0 {
                            Warrior.shared.health = 0
                        }
                    }
                }
                if attackNum == 2 {
                    if Mage.shared.health <= 0 {
                        attackNum = 3
                    }
                    else{
                        Mage.shared.health = Mage.shared.health - charNexit.attack
                        if Mage.shared.health < 0 {
                            Mage.shared.health = 0
                        }
                    }
                }
                if attackNum == 3 {
                    if Heavy.shared.health <= 0{
                        attackNum = 1
                    }
                    else{
                        Heavy.shared.health = Heavy.shared.health - charNexit.attack
                        if Heavy.shared.health < 0 {
                            Heavy.shared.health = 0
                        }
                    }
                }
                run(SKAction.afterDelay(3, runBlock: increment))
                //playerTurn = true
            }
            if Warrior.shared.health <= 0 && Mage.shared.health <= 0 && Heavy.shared.health <= 0 {
                lose()
            }
        }
    }
    
    func win() {
        
    }
    
    func lose() {
        if Warrior.shared.level != 1 {
            Warrior.shared.level -= 1
        }
        Warrior.shared.health = Warrior.shared.maxHealth
        if Mage.shared.level != 1 {
            Mage.shared.level -= 1
        }
        Mage.shared.health = Mage.shared.maxHealth
        if Heavy.shared.level != 1 {
            Heavy.shared.level -= 1
        }
        Heavy.shared.health = Heavy.shared.maxHealth
        sceneDone = true
        if let navController = self.view!.window!.rootViewController as? UINavigationController{
            navController.popViewController(animated: true)
        }
    }
    //(self.view!.window!.rootViewController!.presentedViewController as! FightSceneViewController).leave()
}

