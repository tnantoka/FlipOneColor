//
//  ScoresTableViewController.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/8/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import UIKit

class ScoresTableViewController: UITableViewController {
    
    let reuseIdentifier = "reuseIdentifier"

    var scores: RLMResults?
    var level = AppConfiguration.sharedConfiguration.level {
        didSet {
            navigationItem.rightBarButtonItem?.title = NSLocalizedString("Level \(level)", comment: "")
        }
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.title = NSLocalizedString("Scores", comment: "")
        
        let icon = FAKFontAwesome.listAltIconWithSize(30.0)
        self.tabBarItem.image = icon.imageWithSize(CGSizeMake(icon.iconFontSize, icon.iconFontSize))
    }

    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let levelItem = UIBarButtonItem(
            title: NSLocalizedString("Level  ", comment: ""),
            style: .Plain,
            target: self,
            action: "levelItemDidTap:"
        )
        navigationItem.rightBarButtonItem = levelItem
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.level = AppConfiguration.sharedConfiguration.level
        loadScores()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if let scores = self.scores {
            return min(100, Int(scores.count))
        } else {
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as? UITableViewCell

        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: reuseIdentifier)
            cell?.selectionStyle = .None
        }

        if let score = self.scores?.objectAtIndex(UInt(indexPath.row)) as? Score {
            cell?.textLabel?.text = NSLocalizedString("\(score.moves) moves", comment: "")
            cell?.detailTextLabel?.text = YLMoment(date: score.createdAt).fromNow()
        }
        
        return cell!
    }

    // MARK: - Actions

    func levelItemDidTap(sender: AnyObject) {
        let levelController = LevelViewController()
        levelController.levelDidChange = { (level: Int) in
            self.dismissViewControllerAnimated(true, completion: nil)
            self.level = level
            self.loadScores()
        }
        levelController.presentAsPopover(self, barButtonItem: sender as! UIBarButtonItem)
    }
    
    // MARK: - Utilities
    
    func loadScores() {
        self.scores = Score
            .objectsWithPredicate(NSPredicate(format: "level == \(level)"))
            .sortedResultsUsingProperty("moves", ascending: true)
        tableView.reloadData()
    }
}
