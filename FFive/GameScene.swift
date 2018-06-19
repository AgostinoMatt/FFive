//
//  GameScene.swift
//  FFive
//
//  Created by Matt Agostino on 2018-06-06.
//  Copyright © 2018 Matt Agostino. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    

    var background: SKTileMapNode!
    var player = Player()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        background =
            childNode(withName: "background") as! SKTileMapNode
    }
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


/*
    let characterOfMain = SKSpriteNode(imageNamed: "hero1fight")
    let characterOfMainMovePointsPerSec: CGFloat = 480.0
    let characterOfMainRotateRadiansPerSec: CGFloat = 4.0 * π // alt-p makes π
    //let characterOfMainAnimation: SKAction
    var velocity = CGPoint.zero
    var lastUpdateTime: TimeInterval = 0
    var deltaTime: TimeInterval = 0
    var lastTouchLocation: CGPoint?
    var background: SKTileMapNode!

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
        //background = childNode(withName: "Newtiles") as! SKTileMapNode
     
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder){
     
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
*/

/*
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
     
        /*for i in 0...1 {
         8let background = backgroundNode()
         //background.anchorPoint = CGPoint.zero //CGPoint(x: 0.5, y: 0.5)
         //background.position = CGPoint.zero //CGPoint(x: size.width / 2, y: size.height / 2)
         background.position = CGPoint(x: CGFloat(i) *
         background.size.width, y: 0)
         background.zPosition = -1
         addChild(background)
         }*/
     
        characterOfMain.position = CGPoint(x: 400, y: 400)
        //zombie.run(SKAction.repeatForever(zombieAnimation))
        //startcharacterOfMainAnimation()
        addChild(characterOfMain)
        //spawnEnemy()
        /*run(SKAction.repeatForever(
            SKAction.sequence([SKAction.run() { [unowned self] in
                 self.spawnEnemy()
                }, SKAction.wait(forDuration: 2.0)])))
        run(SKAction.repeatForever(
            SKAction.sequence([SKAction.run() { [unowned self] in
                 self.spawnCat()
                }, SKAction.wait(forDuration: 1.0)])))*/
     
        //playBackgroundMusic(filename: "backgroundMusic.mp3")
     
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
                    //stopZombieAnimation()
                }
                else {
                    move(sprite: characterOfMain, velocity: velocity)
                    rotate(sprite: characterOfMain, direction: velocity, rotateRadiansPerSec: characterOfMainRotateRadiansPerSec)
                }
            }
            //boundsCheck()
            //moveCamera()
     
            cameraNode.position = characterOfMain.position
        }
     
        func moveCharacterOfMainToward(location: CGPoint) {
            let direction = CGPoint(x: location.x - characterOfMain.position.x, y: location.y - characterOfMain.position.y).normalized()
     
            velocity = CGPoint(x: direction.x * characterOfMainMovePointsPerSec, y: direction.y * characterOfMainMovePointsPerSec)
            //startZombieAnimation()
        }
     
        /*func moveCamera(){
            let backgroundVelocity = CGPoint(x: cameraMovePointPerSec, y: 0)
            let amountToMove = backgroundVelocity * CGFloat(deltaTime)
            cameraNode.position += amountToMove
     
            enumerateChildNodes(withName: "background") {node, stop in
                let background = node as! SKSpriteNode
                if background.position.x + background.size.width < self.cameraRect.origin.x {
                    background.position = CGPoint(
                        x: background.position.x + background.size.width * 2,
                        y: background.position.y)
                    stop.pointee = true
                }
            }
        }*/
     
        func move(sprite: SKSpriteNode, velocity: CGPoint) {
            let amountToMove = velocity * CGFloat(deltaTime) //CGPoint(x: velocity.x * CGFloat(deltaTime), y: velocity.y * CGFloat(deltaTime))
            sprite.position += amountToMove //CGPoint(x: sprite.position.x + amountToMove.x, y: sprite.position.y + amountToMove.y)
        }
     
        func rotate(sprite: SKSpriteNode, direction: CGPoint, rotateRadiansPerSec: CGFloat) {
            //sprite.zRotation = direction.angle //atan2(direction.y, direction.x)
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
 */
}
