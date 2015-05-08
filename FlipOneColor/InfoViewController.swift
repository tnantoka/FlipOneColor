//
//  InfoViewController.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/8/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import UIKit

class InfoViewController: FXFormViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.title = NSLocalizedString("Info", comment: "")
        
        let icon = FAKFontAwesome.infoCircleIconWithSize(30.0)
        self.tabBarItem.image = icon.imageWithSize(CGSizeMake(icon.iconFontSize, icon.iconFontSize))
        
        formController.form = InfoForm()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    func acknowledgementsDidTap(sender: AnyObject) {
        let acknowledgementsController = VTAcknowledgementsViewController(acknowledgementsPlistPath: NSBundle.mainBundle().pathForResource("Pods-FlipOneColor-acknowledgements", ofType: "plist"))
        self.navigationController?.pushViewController(acknowledgementsController, animated: true)
    }

    func sourceCodeDidTap(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "https://github.com/tnantoka/FlipOneColor")!)
    }
}
