//
//  AppConfiguration.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/9/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import UIKit

class AppConfiguration {
    static let sharedConfiguration = AppConfiguration()
 
    struct Defaults {
        struct Key {
            static let level = "AppConfiguration.Defaults.Key.level"
        }
    }
    
    init() {
        registerDefaults()
    }
    
    func registerDefaults() {
        let defaultOptions: [NSObject: AnyObject] = [
            Defaults.Key.level: 5,
        ]
        applicationUserDefaults.registerDefaults(defaultOptions)
    }
    
    private var applicationUserDefaults: NSUserDefaults {
        return NSUserDefaults.standardUserDefaults()
    }
    
    var level: Int {
        get {
            return applicationUserDefaults.integerForKey(Defaults.Key.level)
        }
        set {
            applicationUserDefaults.setInteger(newValue, forKey: Defaults.Key.level)
            applicationUserDefaults.synchronize()
        }
    }
}
