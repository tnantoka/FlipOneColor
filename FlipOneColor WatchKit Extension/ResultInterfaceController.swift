//
//  ResultInterfaceController.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/6/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import WatchKit
import Foundation


class ResultInterfaceController: WKInterfaceController {

    @IBOutlet weak var movesLabel: WKInterfaceLabel!
    @IBOutlet weak var newRecordLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let dict = context as! [String: AnyObject]
        let moves = dict["moves"] as! Int
        //let moves = 0
        //let moves = 1
        movesLabel.setText("\(moves) ")
        newRecordLabel.setHidden(true)
        // Configure interface objects here.
        
        let userInfo = [
            "moves": moves
        ]
        WKInterfaceController.openParentApplication(
            userInfo,
            reply: { (replyInfo: [NSObject : AnyObject]!, error: NSError!) -> Void in                
                let newRecord = replyInfo["newRecord"] as! Bool
                self.newRecordLabel.setHidden(!newRecord)
            }
        )
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func retryButtonDidTap() {
        dismissController()
    }
}
