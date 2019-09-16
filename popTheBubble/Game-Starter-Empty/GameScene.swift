//
//  GameScene.swift
//  Game-Starter-Empty
//
//  Created by mitchell hudson on 9/13/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let square1 = SKSpriteNode(texture: nil, color: .blue, size: CGSize(width: 90, height: 190))
    let square2 = SKSpriteNode(texture: nil, color: .blue, size: CGSize(width: 90, height: 190))
    let square3 = SKSpriteNode(texture: nil, color: .blue, size: CGSize(width: 90, height: 190))
    let square4 = SKSpriteNode(texture: nil, color: .blue, size: CGSize(width: 90, height: 190))
    var score: Int = 0
    var scoreLabel: SKLabelNode!
    
    override func didMove(to view: SKView) {
        // Called when the scene has been displayed
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.name = "ScoreLabelNode"
        scoreLabel.fontColor = .white
        scoreLabel.fontSize = 35
        scoreLabel.position.x = view.bounds.width / 2
        scoreLabel.position.y = view.bounds.height / 2
        addChild(scoreLabel)
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        let random = Int.random(in: 1...120)
        
        if random <= 2 {
            
            if let view = self.view {
                
                self.createSquare1(xs: square1.position.x, ys: view.bounds.height + 100)
                self.createSquare2(xs: square2.position.x, ys: view.bounds.height + 100)
                self.createSquare3(xs: square3.position.x, ys: view.bounds.height + 100)
                self.createSquare4(xs: square4.position.x, ys: view.bounds.height + 100)
                
            }
            
            // Called before each frame is rendered
        }
        
    }
    func createSquare1(xs: CGFloat, ys: CGFloat){
        square1.position.x = view!.bounds.minX + 55
        square1.position.y = view!.bounds.height + 100
        square1.color = getRandomColor()
        
        
        let newSqr1 = square1.copy() as! SKNode
        
        addChild(newSqr1)
        
        let action = SKAction.moveTo(y: (view?.bounds.minY)! - 100, duration: Double.random(in: 1...10) )
        let des = SKAction.removeFromParent()
        let seq = SKAction.sequence([action, des])
        newSqr1.run(seq, completion: {
            
            if self.score <= 0 {
                self.scoreLabel.text = "GameOver"
            } else{
                self.score -= 1
                self.scoreLabel.text = "Score: \(self.score)"
            }
        })
        
    }
    func createSquare2(xs: CGFloat, ys: CGFloat){
        
        square2.position.x = view!.bounds.minX + 155
        square2.position.y = view!.bounds.height + 100
        
        square2.color = getRandomColor()
        
        
        let newSqr2 = square2.copy() as! SKNode
        
        addChild(newSqr2)
        
        let action = SKAction.moveTo(y: (view?.bounds.minY)! - 100, duration: Double.random(in: 1...10) )
        let des = SKAction.removeFromParent()
        let seq = SKAction.sequence([action, des])
        newSqr2.run(seq, completion: {
            if self.score <= 0 {
                self.scoreLabel.text = "GameOver"
            } else{
                self.score -= 1
                self.scoreLabel.text = "Score: \(self.score)"
            }
            
        })
    }
    
    func createSquare3(xs: CGFloat, ys: CGFloat){
        
        square3.position.x = view!.bounds.minX + 255
        square3.position.y = view!.bounds.height + 100
        square3.color = getRandomColor()
        
        let newSqr3 = square3.copy() as! SKNode
        
        addChild(newSqr3)
        
        let action = SKAction.moveTo(y: (view?.bounds.minY)! - 100, duration: Double.random(in: 1...10) )
        let des = SKAction.removeFromParent()
        let seq = SKAction.sequence([action, des])
        newSqr3.run(seq, completion: {
            if self.score <= 0 {
                self.scoreLabel.text = "GameOver"
            } else{
                self.score -= 1
                self.scoreLabel.text = "Score: \(self.score)"
            }
        })
    }
    
    func createSquare4(xs: CGFloat, ys: CGFloat){
        square4.position.x = view!.bounds.minX + 355
        square4.position.y = view!.bounds.height + 100
        square4.color = getRandomColor()
        
        let newSqr4 = square4.copy() as! SKNode
        
        addChild(newSqr4)
        
        let action = SKAction.moveTo(y: (view?.bounds.minY)! - 100, duration: Double.random(in: 1...10) )
        let des = SKAction.removeFromParent()
        let seq = SKAction.sequence([action, des])
        newSqr4.run(seq, completion: {
            if self.score <= 0 {
                self.scoreLabel.text = "GameOver"
            } else{
                self.score -= 1
                self.scoreLabel.text = "Score: \(self.score)"
            }
        })
    }
    
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    var touchIndicators: [UIView] = []
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: view)
            let touchIndicator = UIView(frame: CGRect(x: location.x - 10, y: location.y - 10, width: 60, height: 60))
            touchIndicator.alpha = 0.5
            touchIndicator.backgroundColor = getRandomColor()
            touchIndicator.layer.cornerRadius = 10
            self.view!.addSubview(touchIndicator)
            touchIndicators.append(touchIndicator)
            
            for node in self.nodes(at: touch.location(in: self)){
                if node.name != "ScoreLabelNode"{
                    node.removeFromParent()
                    score += 1
                    scoreLabel.text = "Score: \(score)"
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for indicator in touchIndicators {
            indicator.removeFromSuperview()
        }
        touchIndicators = []
    }
}
