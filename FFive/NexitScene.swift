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
    
    func playerFight(){
        
        
        
        //if the playerNumber is equal to 1, run character Of Main actions & animations. Increase playerNumber by 1
        if playerNumber == 1{
            if !charMain.hasActions() {
                charMain.runAnimation()
                print(playerNumber)
                
                playerNumber += 1
            }
        }
            
            //if the playerNumber is equal to 2, run the Girl With Hair actions & animations. Increase playerNumber by 1
        else if playerNumber == 2 {
            if !charMage.hasActions(){
                charMage.runAnimation()
                print(playerNumber)
                playerNumber += 1
            }
        }
            //if the playerNumber is equal to 3, run the Party Member # 2 actions & animations. Increase playerNumber by 1
        else if playerNumber == 3 {
            if !charHeavy.hasActions(){
                charHeavy.runAnimation()
                print(playerNumber)
                playerNumber += 1
            }
        }
        print("players")
    }
    
    func nexitFight() {
        
    }
}
