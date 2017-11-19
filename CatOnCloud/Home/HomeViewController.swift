//
//  HomeViewController.swift
//  CatOnCloud
//
//  Created by Liwen Zhang on 25/10/2017.
//  Copyright © 2017 Liwen Zhang. All rights reserved.
//

import UIKit
import LLCycleScrollView

class HomeViewController: UIViewController {
    
    let viewModel = HomeViewModel()
    let bannerService = BannerService()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var storyBoardBanner: LLCycleScrollView!

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

//        let imagesURLStrings = [
//            "http://www.g-photography.net/file_picture/3/3587/4.jpg",
//            "http://img2.zjolcdn.com/pic/0/13/66/56/13665652_914292.jpg",
//            "http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
//            "http://img3.redocn.com/tupian/20150806/weimeisheyingtupian_4779232.jpg",
//            ];
        
//        self.storyBoardBanner.imagePaths = imagesURLStrings
        self.storyBoardBanner.titles = []
        self.storyBoardBanner.imageViewContentMode = .scaleToFill
        self.storyBoardBanner.pageControlPosition = .left
    }
    
    private func bannerSuccess(images: [String]) {
        DispatchQueue.main.async(execute: {
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

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.homeTableViewCell, for: indexPath) else {
            fatalError("Could not dequeue HomeTableViewCell")
        }
        
        let cellViewModel = viewModel.getCellViewModel(index: indexPath.row)
        cell.updateUI(cellViewModel: cellViewModel)
        return cell
    }
    
    
}
