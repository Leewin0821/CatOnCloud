//
//  MyCatController.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 21/11/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import UIKit
import LLCycleScrollView

class MyCatController: UIViewController {
    
    @IBOutlet weak var storyBoardBanner: LLCycleScrollView!
    @IBOutlet weak var noCatImage: UIImageView!
    @IBOutlet weak var myCatInfoText: UILabel!
    @IBOutlet weak var myCatHelpText: UILabel!
    
    let bannerService = BannerService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        bannerService.retrieveBanner(success: bannerSuccess, failure: bannerFail)
        
        self.storyBoardBanner.titles = []
        self.storyBoardBanner.imageViewContentMode = .scaleToFill
        self.storyBoardBanner.pageControlPosition = .left
    }
    
    private func bannerSuccess(images: [String]) {
        DispatchQueue.main.async(execute: {
            self.myCatInfoText.text = "Sorry, you have no cat."
            self.myCatHelpText.text = "Want to adopt one from the cloud? Find it from cats nearby."
            self.storyBoardBanner.imagePaths = images
        })
    }
    
    private func bannerFail(error: APIError) {
        print(error.message)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
