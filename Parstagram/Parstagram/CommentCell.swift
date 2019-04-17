//
//  CommentCell.swift
//  Parstagram
//
//  Created by Leo Ku on 4/16/19.
//  Copyright © 2019 Shih-Chuan Leo Ku. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {


  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var commentLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
