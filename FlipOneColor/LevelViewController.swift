//
//  LevelViewController.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/8/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    let levels = [
        5,
        7,
        9,
        11,
        13,
    ]
    
    var levelDidChanged: (Int -> Void)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.preferredContentSize = CGSize(width: 300.0, height: 50.0)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        
        // Do any additional setup after loading the view.
        let segmentedControl = UISegmentedControl(items: levels.map { "\($0)" })
        segmentedControl.selectedSegmentIndex = find(levels, AppConfiguration.sharedConfiguration.level) ?? 0
        segmentedControl.frame = CGRectMake(10.0, 10.0, 280, 30)
        segmentedControl.addTarget(self, action: "segmentedControlDidChange:", forControlEvents: .ValueChanged)
        view.addSubview(segmentedControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func segmentedControlDidChange(sender: AnyObject) {
        let segmentedControl = sender as! UISegmentedControl
        let level = levels[segmentedControl.selectedSegmentIndex]
        AppConfiguration.sharedConfiguration.level = level
        if let callback = levelDidChanged {
            callback(level)
        }
    }
    
    func presentAsPopover(controller: UIViewController, barButtonItem: UIBarButtonItem) {
        self.modalPresentationStyle = .Popover
        if let popoverController = self.popoverPresentationController {
            popoverController.permittedArrowDirections = .Up
            popoverController.barButtonItem = barButtonItem
            popoverController.delegate = self
        }
        controller.presentViewController(self, animated: true, completion: nil)
    }
    
    // MARK: - UIPopoverPresentationControllerDelegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
}
