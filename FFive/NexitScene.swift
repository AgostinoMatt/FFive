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
    
    override func didMove(to view: SKView) {
        
        charMain = childNode(withName: "MainCharacter//character") as! Warrior
        charMage = childNode(withName: "Girl//character") as! Mage
        charHeavy = childNode(withName: "SecondPlayer//character") as! Heavy
        charNexit = childNode(withName: "Nexit//character") as! Nexit
        
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
            }
        }
    }
}
