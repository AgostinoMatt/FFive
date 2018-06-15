//
//  GameScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-06.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let characterOfMain = SKSpriteNode(fileNamed: "hero1fight")
    let characterOfMainMovePointsPerSec: CGFloat = 480.0
    let characterOfMainRotateRadiansPerSec: CGFloat = 4.0 * π // alt-p makes π
    let characterOfMainAnimation: SKAction
    var velocity = CGPoint.zero
    var lastUpdateTime: TimeInterval = 0
    var deltaTime: TimeInterval = 0
    var lastTouchLocation: CGPoint?
    
    let playableRect: CGRect
    
    let cameraNode = SKCameraNode()
    let cameraMovePointPerSec: CGFloat = 200.0
    var cameraRect: CGRect {
        let x = cameraNode.position.x - size.width / 2 + (size.width - //current pos subtract half of screen width
            playableRect.width) / 2
        let y = cameraNode.position.y - size.height / 2 + (size.height - // add half of scren width
            playableRect.height) / 2
        
        return CGRect(x: x, y: y, width: playableRect.width, height:
            playableRect.height)
    }
    
    override init(size: CGSize) {
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableHeight = size.width / maxAspectRatio
        let playableMargin = (size.height - playableHeight) / 2.0
        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
        
        var textures: [SKTexture] = []
        
        /*for i in 1...4 {
            textures.append(SKTexture(imageNamed: "zombie\(i)"))
        }
       textures.append(textures[2])
        textures.append(textures[1])
        
        zombieAnimation = SKAction.animate(with: textures, timePerFrame: 0.1)*/
        super.init(size: size)
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        /*for i in 0...1 {
            let background = backgroundNode()
            //background.anchorPoint = CGPoint.zero //CGPoint(x: 0.5, y: 0.5)
            //background.position = CGPoint.zero //CGPoint(x: size.width / 2, y: size.height / 2)
            background.position = CGPoint(x: CGFloat(i) *
                background.size.width, y: 0)
            background.zPosition = -1
            addChild(background)
        }*/
        
        characterOfMain.position = CGPoint(x: 400, y: 400)
        //zombie.run(SKAction.repeatForever(zombieAnimation))
        startcharacterOfMainAnimation()
        addChild(characterOfMain)
        //spawnEnemy()
        run(SKAction.repeatForever(
            SKAction.sequence([SKAction.run() { [unowned self] in
               // self.spawnEnemy()
                }, SKAction.wait(forDuration: 2.0)])))
        run(SKAction.repeatForever(
            SKAction.sequence([SKAction.run() { [unowned self] in
                // self.spawnCat()
                }, SKAction.wait(forDuration: 1.0)])))
        
        //playBackgroundMusic(filename: "backgroundMusic.mp3")
        
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
    }
    
    
    
    
}
