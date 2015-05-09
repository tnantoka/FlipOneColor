//
//  LightsOutScene.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/9/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import UIKit
import SpriteKit

class LightsOutScene: SKScene {

    let padding: CGFloat = 10.0
    let margin: CGFloat = 6.0
    var shapes: [SKShapeNode]!
    var lightsOut: LightsOut!
    var sceneDidClear: (Void -> Void)?
    
    var level = 0 {
        didSet {
            createSceneContents()
        }
    }

    func createSceneContents() {
        removeAllChildren()
        
        let width = size.width - padding * 2.0 - margin * CGFloat(level - 1)
        let shapeSize = width / CGFloat(level)
        let cornerRadius = shapeSize * 0.2
        
        self.shapes = [SKShapeNode]()

        var y = padding
        for i in 0..<level {
            var x = padding
            for j in 0..<level {
                let path = CGPathCreateWithRoundedRect(
                    CGRectMake(0.0, 0.0, shapeSize, shapeSize),
                    cornerRadius,
                    cornerRadius,
                    nil
                )
                let shapeNode = SKShapeNode(path: path)
                shapeNode.position = CGPointMake(x, y)
                shapeNode.strokeColor = SKColor.clearColor()
                addChild(shapeNode)
                shapes.append(shapeNode)
                x += shapeSize + margin
            }
            y += shapeSize + margin
        }
        
        self.lightsOut = LightsOut(level: level)
        for light in lightsOut.lights {
            sync(light)
        }

        self.paused = false
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch {
            let location = touch.locationInNode(self)
            if let node = nodeAtPoint(location) as? SKShapeNode {
                if let index = find(shapes, node) {
                    toggle(index)
                }
            }
        }
    }
    
    func toggle(index: Int) {
        let light = lightsOut.lights[index]
        lightsOut.toggleLight(light)
        
        sync(light)
        sync(light.left)
        sync(light.right)
        sync(light.up)
        sync(light.down)
        
        if lightsOut.isCleared() {
            self.paused = true
            if let didClear = sceneDidClear {
                didClear()
            }
        }
    }
    
    func sync(light: Light?) {
        if let l = light {
            let node = shapes[l.index]
            node.fillColor = (l.on ? SKColor.whiteColor() : SKColor.lightGrayColor())
        }
    }
}
