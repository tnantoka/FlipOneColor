//
//  InfoForm.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/8/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import UIKit

class InfoForm: NSObject, FXForm {
   
    func extraFields() -> [AnyObject]! {
        let acknowledgements = [
            FXFormFieldHeader : "",
            FXFormFieldType : FXFormFieldTypeLabel,
            FXFormFieldAction : "acknowledgementsDidTap:",
            FXFormFieldTitle : NSLocalizedString("Acknowledgements", comment: ""),
            "accessoryType" : UITableViewCellAccessoryType.DisclosureIndicator.rawValue,
        ]

        let sourceCode = [
            FXFormFieldHeader : "",
            FXFormFieldType : FXFormFieldTypeLabel,
            FXFormFieldAction : "sourceCodeDidTap:",
            FXFormFieldTitle : NSLocalizedString("Source code", comment: "")
        ]

        return [
            acknowledgements,
            sourceCode
        ]
    }
}
