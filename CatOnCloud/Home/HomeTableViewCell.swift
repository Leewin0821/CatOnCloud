//
//  HomeTableViewCell.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 31/10/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var catTime: UILabel!
    @IBOutlet weak var catMessage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateUI(cellViewModel: HomeCellViewModel) {
        catName.text = cellViewModel.cat
        catTime.text = cellViewModel.time
        catMessage.text = cellViewModel.message
    }
}