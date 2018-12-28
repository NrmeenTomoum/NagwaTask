//
//  RepositoryTableViewCell.swift
//  NagwaTask
//
//  Created by Nrmeen Tomoum on 12/28/18.
//  Copyright © 2018 Nagwa. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    @IBOutlet weak var reposName: UILabel!
    @IBOutlet weak var reposDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configCell (reposName: String, reposDesc: String)
    {
        self.reposName.text = reposName
        self.reposDescription.text = reposDesc
    }
}
