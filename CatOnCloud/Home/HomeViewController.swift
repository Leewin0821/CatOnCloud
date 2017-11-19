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
