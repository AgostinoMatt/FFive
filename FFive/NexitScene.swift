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
    var  playerNumber = 1
    var playerTurn: Bool = true
    var sceneDone: Bool = false
    
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
        
        charMainLabel.text = "HP: \(charMain.health) / \(charMain.maxHealth)"
        charMageLabel.text = "HP: \(charMage.health) / \(charMage.maxHealth)"
        charHeavyLabel.text = "HP: \(charHeavy.health) / \(charHeavy.maxHealth)"
        
        NexitLabel.text = "HP: \(charNexit.health) / \(charNexit.maxHealth)"
    }
    
    func increment() {
        print(playerNumber)
        playerNumber += 1
        if playerNumber == 5 {
            playerNumber = 0
        }
        print(playerNumber)
        print("incrementing playerNumber")
    }
    func attack() {
        if playerNumber == 1 {
            charNexit.health = charNexit.health - charMain.attack
        }
        else if playerNumber == 2 {
            charNexit.health = charNexit.health - charMage.attack
        }
        else if playerNumber == 3 {
            charNexit.health = charNexit.health - charHeavy.attack
        }
    }
    
    func magic() {
        if playerNumber == 1 {
            charNexit.health = charNexit.health - charMain.magic
        }
        else if playerNumber == 2 {
            charNexit.health = charNexit.health - charMage.magic
            
        }
        else if playerNumber == 3 {
            charNexit.health = charNexit.health - charHeavy.magic
        }
    }
    
    func playerFight(){
        
        //if the playerNumber is equal to 1, run character Of Main actions & animations. Increase playerNumber by 1
        if playerNumber == 1{
            if !charMain.hasActions() {
                charMain.runAnimation()
                print(playerNumber)
                run(SKAction.afterDelay(3, runBlock: increment))
            }
        }
            
            //if the playerNumber is equal to 2, run the Girl With Hair actions & animations. Increase playerNumber by 1
        else if playerNumber == 2 {
            if !charMage.hasActions(){
                charMage.runAnimation()
                print(playerNumber)
                run(SKAction.afterDelay(3, runBlock: increment))
            }
        }
            //if the playerNumber is equal to 3, run the Party Member # 2 actions & animations. Increase playerNumber by 1
        else if playerNumber == 3 {
            if !charHeavy.hasActions(){
                charHeavy.runAnimation()
                print(playerNumber)
                run(SKAction.afterDelay(3, runBlock: increment))
            }
        }
        print("players")
    }
    
    func nexitFight() {
        let attackNum = Int.random(1...3) //attackNum set to a random integer
        
        if playerNumber == 4 {
            if !charNexit.hasActions(){
                charNexit.runAnimation()
                if attackNum == 1 {
                    charMain.health = charMain.health - charNexit.attack
                }
                else if attackNum == 2 {
                    charMage.health = charMage.health - charNexit.attack
                }
                else if attackNum == 3 {
                    charHeavy.health = charHeavy.health - charNexit.attack
                }
                run(SKAction.afterDelay(3, runBlock: increment))
                //playerTurn = true
            }
        }
    }
    
    func win() {
        
    }
    
    func lose() {
        sceneDone = true
        if let navController = self.view!.window!.rootViewController as? UINavigationController{
            if let fightController = navController.presentedViewController as? FightSceneViewController{
                fightController.leave()
            }
        }
        //(self.view!.window!.rootViewController!.presentedViewController as! FightSceneViewController).leave()
    }
}
