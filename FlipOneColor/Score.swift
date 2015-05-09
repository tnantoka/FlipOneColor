//
//  Score.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/6/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import UIKit

class Score: RLMObject {
    dynamic var moves = 0
    dynamic var level = 0
    dynamic var createdAt = NSDate()
    
    class func isNewRecord(moves: Int, level: Int) -> Bool{
        return objectsWithPredicate(NSPredicate(format: "moves <= \(moves) && level == \(level)")).count == 0
    }
}
