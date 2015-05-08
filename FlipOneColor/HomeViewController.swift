//
//  HomeViewController.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/8/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.title = NSLocalizedString("Home", comment: "")
        
        let icon = FAKFontAwesome.homeIconWithSize(30.0)
        self.tabBarItem.image = icon.imageWithSize(CGSizeMake(icon.iconFontSize, icon.iconFontSize))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let resetItem = UIBarButtonItem(title: "Reset", style: .Plain, target: self, action: "resetItemDidTap:")
        navigationItem.leftBarButtonItem = resetItem

        let levelItem = UIBarButtonItem(title: "Level", style: .Plain, target: self, action: "levelItemDidTap:")
        navigationItem.rightBarButtonItem = levelItem
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

    func resetItemDidTap(sender: AnyObject) {
        
    }
    
    func levelItemDidTap(sender: AnyObject) {
        let barButtonItem = sender as! UIBarButtonItem
        let levelController = LevelViewController()
        levelController.levelDidChanged = { (level: Int) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        levelController.presentAsPopover(self, barButtonItem: barButtonItem)
    }    
}