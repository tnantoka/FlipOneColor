//
//  HomeViewController.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/8/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import UIKit
import SpriteKit

class HomeViewController: UIViewController {
    
    weak var skView: SKView!
    weak var lightsOutScene: LightsOutScene!
    
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
        
        let backgroundColor = UIColor(white: 0.3, alpha: 1.0)
        
        view.backgroundColor = backgroundColor

        // Do any additional setup after loading the view.
        let resetItem = UIBarButtonItem(title: "Reset", style: .Plain, target: self, action: "resetItemDidTap:")
        navigationItem.leftBarButtonItem = resetItem

        let levelItem = UIBarButtonItem(title: "Level", style: .Plain, target: self, action: "levelItemDidTap:")
        navigationItem.rightBarButtonItem = levelItem
        
        let size = CGRectGetWidth(view.bounds)
        let skView = SKView(frame: CGRectMake(0.0, 0.0, size, size))
        self.skView = skView
        view.addSubview(skView)
        
        #if DEBUG
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.showsDrawCount = true
        skView.showsPhysics = true
        skView.showsFields = true
        skView.showsQuadCount = true
        #endif
        
        skView.ignoresSiblingOrder = true
        
        let lightsOutScene = LightsOutScene(size: skView.bounds.size)
        lightsOutScene.level = AppConfiguration.sharedConfiguration.level
        lightsOutScene.sceneDidClear = {
            let newRecord = self.addScore()
            self.showClearAlert(newRecord)
        }
        lightsOutScene.backgroundColor = backgroundColor
        self.lightsOutScene = lightsOutScene
        skView.presentScene(lightsOutScene)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        skView.center = CGPointMake(
            view.center.x,
            view.center.y + 8.0 // Adjust for iPhone 4S with Ad
        )
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
        lightsOutScene.createSceneContents()
    }
    
    func levelItemDidTap(sender: AnyObject) {
        let barButtonItem = sender as! UIBarButtonItem
        let levelController = LevelViewController()
        levelController.levelDidChange = { (level: Int) in
            self.dismissViewControllerAnimated(true, completion: nil)
            self.lightsOutScene.level = level
        }
        levelController.presentAsPopover(self, barButtonItem: barButtonItem)
    }
    
    func showClearAlert(newRecord: Bool) {
        let alertController = UIAlertController(
            title: NSLocalizedString("Clear", comment: ""),
            message: newRecord ? NSLocalizedString("New Record", comment: "") : "",
            preferredStyle: .Alert
        )
        
        alertController.addAction(
            UIAlertAction(
                title: NSLocalizedString("Retry", comment: ""),
                style: .Default,
                handler: { (action: UIAlertAction!) -> Void in
                    self.lightsOutScene.createSceneContents()
                }
            )
        )
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func addScore() -> Bool {
        let moves = lightsOutScene.lightsOut.moves
        let level = lightsOutScene.lightsOut.level
        
        let score = Score()
        score.moves = moves
        score.level = level
        score.createdAt = NSDate()
        
        let newRecord = Score.isNewRecord(moves, level: level)
        
        let realm = RLMRealm.defaultRealm()
        realm.transactionWithBlock({ () -> Void in
            realm.addObject(score)
        })
        
        return newRecord
    }
}