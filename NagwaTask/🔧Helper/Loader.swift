//
//  ViewController.swift
//  NagwaTask
//
//  Created by Nrmeen Tomoum on 12/28/18.
//  Copyright © 2018 Nagwa. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

class loader: NSObject {
    
    
    func startIndecator(_ view:UIView)
    {
        
        let spinnerActivity = MBProgressHUD.showAdded(to: view, animated: true);
        spinnerActivity.contentColor = UIColor.black
        spinnerActivity.backgroundColor = UIColor.clear
        spinnerActivity.isUserInteractionEnabled = false;
        view.isUserInteractionEnabled = false
    }
    func stopIndecator(_ view:UIView)
    {
        MBProgressHUD.hideAllHUDs(for: view, animated: true)
        view.isUserInteractionEnabled = true
    }
    
    
}
