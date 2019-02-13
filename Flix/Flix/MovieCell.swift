//
//  MovieCell.swift
//  Flix
//
//  Created by Leo Ku on 2/12/19.
//  Copyright © 2019 Shih-Chuan Leo Ku. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var synopsisLabel: UILabel!
  @IBOutlet weak var posterView: UIImageView!
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
