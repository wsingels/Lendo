//
//  GameScene.swift
//  Jungle Man
//
//  Created by William Singelstad on 4/1/17.
//  Copyright © 2017 William Singelstad. All rights reserved.
//

import SpriteKit
import GameplayKit
 let player = SKSpriteNode(imageNamed: "man")

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "man")
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "blank space")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
               player.setScale(1)
        player.position = CGPoint(x: self.size.width/2, y: self.size.height/5)
        player.zPosition = 2
        self.addChild(player)
    }
    func throwStone()
    {
        let stone = SKSpriteNode(imageNamed: "rock")
        stone.setScale(1)
        stone.position = player.position
        stone.zPosition = 1
        self.addChild(stone)
        
        let moveStone = SKAction.moveTo(y: self.size.height + stone.size.height, duration: 1)
        let deleteStone = SKAction.removeFromParent()
        let stoneSequence = SKAction.sequence([moveStone, deleteStone])
        stone.run(stoneSequence)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        throwStone()
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(self)
            let previousPointOfTouch = touch.previousLocation(self)
            let amountDragged = pointOfTouch.x - previousPointOfTouch.x
            player.position.x += amountDragged
            
        }
    }
}
