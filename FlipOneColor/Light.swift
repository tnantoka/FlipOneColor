//
//  Light.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/5/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import UIKit

class Light {
    var index: Int = 0
    var on: Bool = false
    
    var left: Light?
    var right: Light?
    var up: Light?
    var down: Light?
    
    func toggle(tapped: Bool) {
        self.on = !self.on
        if tapped {
            left?.toggle(false)
            right?.toggle(false)
            up?.toggle(false)
            down?.toggle(false)
        }
    }
}
