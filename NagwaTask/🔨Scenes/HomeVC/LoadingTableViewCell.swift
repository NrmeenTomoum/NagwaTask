//
//  LoadingTableViewCell.swift
//  NagwaTask
//
//  Created by Nrmeen Tomoum on 12/29/18.
//  Copyright © 2018 Nagwa. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {
    @IBOutlet weak var loadingIndector: NSLayoutConstraint!
    @IBOutlet weak var progressActivity: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        progressActivity.startAnimating()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
