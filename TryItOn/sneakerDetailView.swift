//
//  sneakerDetailView.swift
//  arDetector
//
//  Created by snoopy on 10/08/2021.
//

import UIKit
import expanding_collection

class sneakerDetailView: ExpandingTableViewController {
    
    fileprivate var scrollOffsetY: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureNavBar()
//        let image1 = Assets.backgroundImage.image
        tableView.backgroundView = UIImageView(image: UIImage(named: "backgroud"))
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
    }
}

