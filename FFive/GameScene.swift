//
//  GameScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-06.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    

   //var background: SKTileMapNode!
    //var player = Player()
    
    /*
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        background =
            childNode(withName: "background") as! SKTileMapNode
    }*/
/*
    let characterOfMain:SKSpriteNode
    let characterOfMainMovePointsPerSec: CGFloat = 480.0
    let characterOfMainRotateRadiansPerSec: CGFloat = 4.0 * π // alt-p makes π
    let characterOfMainAnimation: SKAction
    var velocity = CGPoint.zero
    var lastUpdateTime: TimeInterval = 0
    var deltaTime: TimeInterval = 0
    var lastTouchLocation: CGPoint?
    
    
    
    
    override func didMove(to view: SKView) {
        addChild(player)
        
    override init(size: CGSize) {
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableHeight = size.width / maxAspectRatio
        let playableMargin = (size.height - playableHeight) / 2.0
        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
        
        var textures: [SKTexture] = []
        
        for i in 1...4 {
            textures.append(SKTexture(imageNamed: "hero\(i)"))
        }
       textures.append(textures[2])
        textures.append(textures[1])
        
        characterOfMain =  SKSpriteNode(imageNamed: "hero1fight")
        
        //zombieAnimation = SKAction.animate(with: textures, timePerFrame: 0.1)
        super.init(size: size)
    }
}*/



    var characterOfMain: SKSpriteNode!
    let characterOfMainMovePointsPerSec: CGFloat = 480.0
    let characterOfMainRotateRadiansPerSec: CGFloat = 4.0 * π // alt-p makes π
    //let characterOfMainAnimation: SKAction
    var velocity = CGPoint.zero
    var lastUpdateTime: TimeInterval = 0
    var deltaTime: TimeInterval = 0
    var lastTouchLocation: CGPoint?
    var background: SKTileMapNode!

    var playableRect: CGRect!

    let cameraNode = SKCameraNode()
    let cameraMovePointPerSec: CGFloat = 200.0
    var cameraRect: CGRect {
        let x = cameraNode.position.x - size.width / 2 + (size.width - playableRect.width) / 2
        let y = cameraNode.position.y - size.height / 2 + (size.height - playableRect.height) / 2
     
        return CGRect(x: x, y: y, width: playableRect.width, height:
            playableRect.height)
    }

    required init?(coder aDecoder: NSCoder){
        
        
        super.init(coder: aDecoder)
       
        background = childNode(withName: "background") as? SKTileMapNode
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableHeight = size.width / maxAspectRatio
        let playableMargin = (size.height - playableHeight) / 2.0
        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
        
        characterOfMain = SKSpriteNode(imageNamed: "hero8")
        
        //fatalError("init(coder:) has not been implemented")
        
    }
    

    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
     
     
        characterOfMain.position = CGPoint(x: 400, y: 400)
        //startcharacterOfMainAnimation()
        addChild(characterOfMain)
     
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        }
     
        override func update(_ currentTime: TimeInterval) {
            if lastUpdateTime > 0 {
                deltaTime = currentTime - lastUpdateTime
            }
            else {
                deltaTime = 0
            }
            lastUpdateTime = currentTime
     
            if let lastTouchLocation = lastTouchLocation {
                let diff = lastTouchLocation - characterOfMain.position
                if diff.length() < characterOfMainMovePointsPerSec * CGFloat(deltaTime) {
                    characterOfMain.position = lastTouchLocation
                    velocity = CGPoint.zero
                }
                else {
                    move(sprite: characterOfMain, velocity: velocity)
                    rotate(sprite: characterOfMain, direction: velocity, rotateRadiansPerSec: characterOfMainRotateRadiansPerSec)
                }
            }
     
            cameraNode.position = characterOfMain.position
        }
     
        func moveCharacterOfMainToward(location: CGPoint) {
            let direction = CGPoint(x: location.x - characterOfMain.position.x, y: location.y - characterOfMain.position.y).normalized()
     
            velocity = CGPoint(x: direction.x * characterOfMainMovePointsPerSec, y: direction.y * characterOfMainMovePointsPerSec)
        }
     
        func move(sprite: SKSpriteNode, velocity: CGPoint) {
            let amountToMove = velocity * CGFloat(deltaTime)
            sprite.position += amountToMove
        }
     
        func rotate(sprite: SKSpriteNode, direction: CGPoint, rotateRadiansPerSec: CGFloat) {
            let shortest = shortestAngleBetween(angle1: sprite.zRotation, angle2: direction.angle)
            let amountToRotate = min(rotateRadiansPerSec * CGFloat(deltaTime), abs(shortest))
            sprite.zRotation += shortest.sign() * amountToRotate
        }
     
        func sceneTouched(touchLocation: CGPoint) {
            lastTouchLocation = touchLocation
            moveCharacterOfMainToward(location: touchLocation)
        }
     
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            guard let touch = touches.first else {
                return
            }
     
            let touchLocation = touch.location(in: self)
            sceneTouched(touchLocation: touchLocation)
        }
 
}
