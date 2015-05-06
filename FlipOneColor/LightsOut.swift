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
    
    init() {
        for i in 0..<25 {
            let light = Light()
            light.index = i
            lights.append(light)
        }
        
        for (i, light) in enumerate(lights) {
            if i % 5 != 0 {
                light.left = lights[i - 1]
            }
            if i % 5 != 4 {
                light.right = lights[i + 1]
            }
            if i > 4 {
                light.up = lights[i - 5]
            }
            if i < 20 {
                light.down = lights[i + 5]                
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
        return lights.filter({ $0.on }).isEmpty || lights.filter({ !$0.on }).isEmpty
    }
}
