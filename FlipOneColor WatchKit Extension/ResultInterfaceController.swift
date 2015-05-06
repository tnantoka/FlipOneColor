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
        let newRecord = dict["newRecord"] as! Bool
        movesLabel.setText("\(moves) ")
        newRecordLabel.setHidden(!newRecord)
        // Configure interface objects here.
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
