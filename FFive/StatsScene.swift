//
//  StatsScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-07-02.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit

class StatsScene: SKScene{
    
    let charMainHP = SKLabelNode()
    let charMainAttack = SKLabelNode()
    let charMainMagic = SKLabelNode()
    let charMainLevel = SKLabelNode()
    let charMainEXP = SKLabelNode()
    let charMageHP = SKLabelNode()
    let charMageAttack = SKLabelNode()
    let charMageMagic = SKLabelNode()
    let charMageLevel = SKLabelNode()
    let charMageEXP = SKLabelNode()
    let charHeavyHP = SKLabelNode()
    let charHeavyAttack = SKLabelNode()
    let charHeavyMagic = SKLabelNode()
    let charHeavyLevel = SKLabelNode()
    let charHeavyEXP = SKLabelNode()
    
    override func didMove(to view: SKView) {
        
        charMainHP.fontColor = SKColor.black
        charMainHP.fontSize = 30
        charMainHP.zPosition = 100
        charMainHP.position = CGPoint(x: -320, y: 80)
        
        charMainAttack.fontColor = SKColor.black
        charMainAttack.fontSize = 30
        charMainAttack.zPosition = 100
        charMainAttack.position = CGPoint(x: -320, y: 20)
        
        charMainMagic.fontColor = SKColor.black
        charMainMagic.fontSize = 30
        charMainMagic.zPosition = 100
        charMainMagic.position = CGPoint(x: -320, y: -40)
        
        charMainEXP.fontColor = SKColor.black
        charMainEXP.fontSize = 30
        charMainEXP.zPosition = 100
        charMainEXP.position = CGPoint(x: -320, y: -100)
        
        charMainLevel.fontColor = SKColor.black
        charMainLevel.fontSize = 30
        charMainLevel.zPosition = 100
        charMainLevel.position = CGPoint(x: -320, y: -160)
        
        charMageHP.fontColor = SKColor.black
        charMageHP.fontSize = 30
        charMageHP.zPosition = 100
        charMageHP.position = CGPoint(x: 0, y: 80)
        
        charMageAttack.fontColor = SKColor.black
        charMageAttack.fontSize = 30
        charMageAttack.zPosition = 100
        charMageAttack.position = CGPoint(x: 0, y: 20)
        
        charMageMagic.fontColor = SKColor.black
        charMageMagic.fontSize = 30
        charMageMagic.zPosition = 100
        charMageMagic.position = CGPoint(x: 0, y: -40)
        
        charMageEXP.fontColor = SKColor.black
        charMageEXP.fontSize = 30
        charMageEXP.zPosition = 100
        charMageEXP.position = CGPoint(x: 0, y: -100)
        
        charMageLevel.fontColor = SKColor.black
        charMageLevel.fontSize = 30
        charMageLevel.zPosition = 100
        charMageLevel.position = CGPoint(x: 0, y: -160)
        
        charHeavyHP.fontColor = SKColor.black
        charHeavyHP.fontSize = 30
        charHeavyHP.zPosition = 100
        charHeavyHP.position = CGPoint(x: 320, y: 80)
        
        charHeavyAttack.fontColor = SKColor.black
        charHeavyAttack.fontSize = 30
        charHeavyAttack.zPosition = 100
        charHeavyAttack.position = CGPoint(x: 320, y: 20)
        
        charHeavyMagic.fontColor = SKColor.black
        charHeavyMagic.fontSize = 30
        charHeavyMagic.zPosition = 100
        charHeavyMagic.position = CGPoint(x: 320, y: -40)
        
        charHeavyEXP.fontColor = SKColor.black
        charHeavyEXP.fontSize = 30
        charHeavyEXP.zPosition = 100
        charHeavyEXP.position = CGPoint(x: 320, y: -100)
        
        charHeavyLevel.fontColor = SKColor.black
        charHeavyLevel.fontSize = 30
        charHeavyLevel.zPosition = 100
        charHeavyLevel.position = CGPoint(x: 320, y: -160)
        
        self.addChild(charMainHP)
        self.addChild(charMainAttack)
        self.addChild(charMainMagic)
        self.addChild(charMainEXP)
        self.addChild(charMainLevel)
        self.addChild(charMageHP)
        self.addChild(charMageAttack)
        self.addChild(charMageMagic)
        self.addChild(charMageEXP)
        self.addChild(charMageLevel)
        self.addChild(charHeavyHP)
        self.addChild(charHeavyAttack)
        self.addChild(charHeavyMagic)
        self.addChild(charHeavyEXP)
        self.addChild(charHeavyLevel)
    }
    
    override func update(_ currentTime: TimeInterval) {
        charMainHP.text = "HP: \(Warrior.shared.maxHealth)"
        charMainAttack.text = "ATT-POW: \(Warrior.shared.attack)"
        charMainMagic.text = "MG-POW: \(Warrior.shared.magic)"
        charMainEXP.text = "EXP: \(Warrior.shared.exp) / 200"
        charMainLevel.text = "LVL: \(Warrior.shared.level)"
        charMageHP.text = "HP: \(Mage.shared.maxHealth)"
        charMageAttack.text = "ATT-POW: \(Mage.shared.attack)"
        charMageMagic.text = "MG-POW: \(Mage.shared.magic)"
        charMageEXP.text = "EXP: \(Mage.shared.exp) / 200"
        charMageLevel.text = "LVL: \(Mage.shared.level)"
        charHeavyHP.text = "HP: \(Heavy.shared.maxHealth)"
        charHeavyAttack.text = "ATT-POW: \(Heavy.shared.attack)"
        charHeavyMagic.text = "MG-POW: \(Heavy.shared.magic)"
        charHeavyEXP.text = "EXP: \(Heavy.shared.exp) / 200"
        charHeavyLevel.text = "LVL: \(Heavy.shared.level)"
    }
}
