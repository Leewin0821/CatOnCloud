//
//  CatViewController.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 18/10/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import UIKit

class CatViewController: UIViewController {
    @IBOutlet var imageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = imageView
    }
}
