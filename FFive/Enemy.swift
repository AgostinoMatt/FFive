//
//  Enemy.swift
//  FFive
//
//  Created by Alexx Quan on 2018-06-20.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import Foundation
import SpriteKit



class Enemy: SKSpriteNode {
    
    enum EnemyStats {
        static var enemyHealth: Int = 100 + (level * 10)
        static var enemyAttack: Int = 10 + level
        static var enemyMagic: Int = 10 + level
        static var expGiven: Int = 0
        static var level: Int = 1
    }
    
    var Description: String{
        return " Enemy has\(enemyHealth) and can do \(enemyAttack) damage"

        func attackPlayer() {
            //TODO
        }
        
        let someEnemy = Enemy()
        print("Enemy: \(someEnemy.description)")
    }
    
    
}

