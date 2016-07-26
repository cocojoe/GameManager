//
//  GameScene.swift
//  GameManager
//
//  Created by Martin Walsh on 26/07/2016.
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    /* Short form access to singleton */
    let gameManager = GameManager.sharedInstance
    var myLabel:SKLabelNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Score: \(gameManager.highScore)"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for _ in touches {
            
            gameManager.highScore += 1
            myLabel.text = "Score: \(gameManager.highScore)"
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
