//
//  LightsOut.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/5/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import UIKit

class LightsOut {
    var lights = [Light]()
    var moves = 0
    var level: Int
    
    convenience init() {
        self.init(level: 5)
    }
    
    init(level: Int) {
        self.level = level
        let length = (level * level)
        
        for i in 0..<length {
            let light = Light()
            light.index = i
            lights.append(light)
        }
        
        for (i, light) in enumerate(lights) {
            if i % level != 0 {
                light.left = lights[i - 1]
            }
            if i % level != (level - 1) {
                light.right = lights[i + 1]
            }
            if i > (level - 1) {
                light.up = lights[i - level]
            }
            if i < (length - level) {
                light.down = lights[i + level]
            }
        }

        for i in 0..<20 {
            let index = Int(arc4random_uniform(UInt32(lights.count)))
            let light = lights[index]
            light.toggle(true)
        }
    }
    
    func toggleLight(light: Light) {
        light.toggle(true)
        moves++
    }

    func isCleared() -> Bool {
        #if DEBUG
            if moves > 5 {
                return true
            }
        #endif
        return lights.filter({ $0.on }).isEmpty || lights.filter({ !$0.on }).isEmpty
    }
}
