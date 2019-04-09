//
//  PostCell.swift
//  Parstagram
//
//  Created by Leo Ku on 4/8/19.
//  Copyright © 2019 Shih-Chuan Leo Ku. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

  @IBOutlet weak var photoView: UIImageView!
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var captionLabel: UILabel!
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
