//
//  ViewController.swift
//  NagwaTask
//
//  Created by Nrmeen Tomoum on 12/28/18.
//  Copyright © 2018 Nagwa. All rights reserved.
//

import Foundation
import FCAlertView
class CAlert
{
    class func createAlert (title :String, subTitle: String,vc : UIViewController , buttons : [String] = [])
    {
        let alert = FCAlertView()
        alert.delegate = (vc as! FCAlertViewDelegate)
        //   alert.makeAlertTypeSuccess()
        alert.doneButtonTitleColor = UIColor.white
        alert.firstButtonTitleColor   = UIColor.black
        alert.doneButtonHighlightedBackgroundColor = UIColor.black
        alert.colorScheme = alert.flatGray
        alert.tintColor = UIColor.black
        alert.showAlert(withTitle: title, withSubtitle: subTitle, withCustomImage: nil, withDoneButtonTitle:"OK", andButtons:buttons)
    }
}
