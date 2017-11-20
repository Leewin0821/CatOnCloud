//
//  MomentCellModel.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 19/11/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import UIKit

class MomentImageCell: UICollectionViewCell {
    var imageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        imageView = UIImageView()
        imageView?.image = UIImage(named: "thumb1.jpg")
        self.addSubview(imageView!)
    }
    
}
