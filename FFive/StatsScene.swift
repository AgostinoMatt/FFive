//
//  StatsScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-07-02.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit

class StatsScene: SKScene{
    var charMain: Warrior!
    var charMage: Mage!
    var charHeavy: Heavy!
    
    let charMainHP = SKLabelNode()
    let charMainAttack = SKLabelNode()
    let CharMainMagic = SKLabelNode()
    let charMainLevel = SKLabelNode()
    let charMainEXP = SKLabelNode()
    let charMageHP = SKLabelNode()
    let charMageAttack = SKLabelNode()
    let CharMageMagic = SKLabelNode()
    let charMageLevel = SKLabelNode()
    let charMageEXP = SKLabelNode()
    let charHeavyHP = SKLabelNode()
    let charHeavyAttack = SKLabelNode()
    let CharHeavyMagic = SKLabelNode()
    let charHeavyLevel = SKLabelNode()
    let charHeavyEXP = SKLabelNode()
    
    override func didMove(to view: SKView) {
        
        charMain = childNode(withName: "Main") as! Warrior
        charMage = childNode(withName: "Girl") as! Mage
        charHeavy = childNode(withName: "Second") as! Heavy
        
        charMainHP.text = "HP: \(charMain.maxHealth)"
        charMainHP.fontColor = SKColor.black
        charMainHP.fontSize = 30
        charMainHP.zPosition = 100
        charMainHP.position = CGPoint(x: -375, y: 200)
        
        charMageHP.text = "HP: \(charMage.maxHealth)"
        charMageHP.fontColor = SKColor.black
        charMageHP.fontSize = 20
        charMageHP.zPosition = 100
        charMageHP.position = CGPoint(x: 0, y: 200)
        
        charHeavyHP.text = "HP: \(charHeavy.maxHealth)"
        charHeavyHP.fontColor = SKColor.black
        charHeavyHP.fontSize = 20
        charHeavyHP.zPosition = 100
        charHeavyHP.position = CGPoint(x: 375, y: 200)
        
        self.addChild(charMainHP)
        self.addChild(charMageHP)
        self.addChild(charHeavyHP)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        //charMainHP.text = "HP: \(charMain.maxHealth)"
        //charMageHP.text = "HP: \(charMage.maxHealth)"
        //charHeavyHP.text = "HP: \(charHeavy.maxHealth)"
    }
}
