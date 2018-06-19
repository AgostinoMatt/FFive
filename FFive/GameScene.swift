//
//  GameScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-06.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {


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
        
    }
    

    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
     
     
        characterOfMain.position = CGPoint(x: 400, y: 400)
        //startcharacterOfMainAnimation()
        addChild(characterOfMain)
     
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: size.width / 1.5, y: size.height / 1.5)
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
