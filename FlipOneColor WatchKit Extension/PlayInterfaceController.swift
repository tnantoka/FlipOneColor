//
//  PlayInterfaceController.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/5/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import WatchKit
import Foundation


class PlayInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var button1: WKInterfaceButton!
    @IBOutlet weak var button2: WKInterfaceButton!
    @IBOutlet weak var button3: WKInterfaceButton!
    @IBOutlet weak var button4: WKInterfaceButton!
    @IBOutlet weak var button5: WKInterfaceButton!
    
    @IBOutlet weak var button6: WKInterfaceButton!
    @IBOutlet weak var button7: WKInterfaceButton!
    @IBOutlet weak var button8: WKInterfaceButton!
    @IBOutlet weak var button9: WKInterfaceButton!
    @IBOutlet weak var button10: WKInterfaceButton!
    
    @IBOutlet weak var button11: WKInterfaceButton!
    @IBOutlet weak var button12: WKInterfaceButton!
    @IBOutlet weak var button13: WKInterfaceButton!
    @IBOutlet weak var button14: WKInterfaceButton!
    @IBOutlet weak var button15: WKInterfaceButton!
    
    @IBOutlet weak var button16: WKInterfaceButton!
    @IBOutlet weak var button17: WKInterfaceButton!
    @IBOutlet weak var button18: WKInterfaceButton!
    @IBOutlet weak var button19: WKInterfaceButton!
    @IBOutlet weak var button20: WKInterfaceButton!
    
    @IBOutlet weak var button21: WKInterfaceButton!
    @IBOutlet weak var button22: WKInterfaceButton!
    @IBOutlet weak var button23: WKInterfaceButton!
    @IBOutlet weak var button24: WKInterfaceButton!
    @IBOutlet weak var button25: WKInterfaceButton!
    
    var buttons: [WKInterfaceButton]!
    var lightsOut: LightsOut!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        self.buttons = [
            button1,
            button2,
            button3,
            button4,
            button5,
            
            button6,
            button7,
            button8,
            button9,
            button10,
            
            button11,
            button12,
            button13,
            button14,
            button15,
            
            button16,
            button17,
            button18,
            button19,
            button20,
            
            button21,
            button22,
            button23,
            button24,
            button25,
        ]
        self.lightsOut = LightsOut()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if lightsOut.isCleared() {
            self.lightsOut = LightsOut()            
        }
        
        for light in lightsOut.lights {
            sync(light)
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
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
            let context = [
                "moves": lightsOut.moves,
                "level": lightsOut.level,
            ]
            presentControllerWithName("resultController", context: context)
        }
    }

    func sync(light: Light?) {
        if let l = light {
            buttons[l.index].setBackgroundColor(l.on ? UIColor.whiteColor() : UIColor.lightGrayColor())
        }
    }
    
    @IBAction func button1DidTap() {
        toggle(0)
    }
    @IBAction func button2DidTap() {
        toggle(1)
    }
    @IBAction func button3DidTap() {
        toggle(2)
    }
    @IBAction func button4DidTap() {
        toggle(3)
    }
    @IBAction func button5DidTap() {
        toggle(4)
    }

    @IBAction func button6DidTap() {
        toggle(5)
    }
    @IBAction func button7DidTap() {
        toggle(6)
    }
    @IBAction func button8DidTap() {
        toggle(7)
    }
    @IBAction func button9DidTap() {
        toggle(8)
    }
    @IBAction func button10DidTap() {
        toggle(9)
    }

    @IBAction func button11DidTap() {
        toggle(10)
    }
    @IBAction func button12DidTap() {
        toggle(11)
    }
    @IBAction func button13DidTap() {
        toggle(12)
    }
    @IBAction func button14DidTap() {
        toggle(13)
    }
    @IBAction func button15DidTap() {
        toggle(14)
    }
    
    @IBAction func button16DidTap() {
        toggle(15)
    }
    @IBAction func button17DidTap() {
        toggle(16)
    }
    @IBAction func button18DidTap() {
        toggle(17)
    }
    @IBAction func button19DidTap() {
        toggle(18)
    }
    @IBAction func button20DidTap() {
        toggle(19)
    }

    @IBAction func button21DidTap() {
        toggle(20)
    }
    @IBAction func button22DidTap() {
        toggle(21)
    }
    @IBAction func button23DidTap() {
        toggle(22)
    }
    @IBAction func button24DidTap() {
        toggle(23)
    }
    @IBAction func button25DidTap() {
        toggle(24)
    }
}
