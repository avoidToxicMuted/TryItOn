//
//  DemoCollectionViewCell.swift
//  TestCollectionView
//
//  Created by Alex K. on 12/05/16.
//  Copyright © 2016 Alex K. All rights reserved.
//

import UIKit
import expanding_collection

protocol HistoricoClienteServidorTableViewCellDelegate {
    func didButtonPressed()
    func purchaseTapped()
}

class HomeCollectionViewCell: BasePageCollectionCell {

    
    var delegate: HistoricoClienteServidorTableViewCellDelegate?
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var customTitle: UILabel!

    @IBOutlet var purchase : UIButton!
    @IBOutlet var tryOn : UIButton!
    @IBAction func buttonTap(_ Sender : AnyObject){
        
//        let destination = UIStoryboard(name: "Storyboard",bundle:nil).instantiateViewController(withIdentifier: "your_viewcontroller_id")
//        present(destination, animated: false, completion: nil)
        delegate?.didButtonPressed()
        
    }
    
    
    
    @objc func handleCall() {
        delegate?.purchaseTapped()
    }
    
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//
//        if let yourVC = segue.destination as? ViewController {
//         if let details = productDetails {
//            let singleProd = details[selectedIndex]
//            yourVC.singleProd = singleProd
//
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let buy = UITapGestureRecognizer(target: self, action: #selector(handleCall))
        purchase.addGestureRecognizer(buy)

        backgroundImageView.layer.masksToBounds = true
        backgroundImageView.layer.cornerRadius = 9.0
        
        tryOn.layer.masksToBounds = true
        tryOn.layer.cornerRadius = 8.0
        
        purchase.layer.masksToBounds = true
        purchase.layer.cornerRadius = 8.0
        
        tryOn.layer.shadowRadius = 2
        tryOn.layer.shadowOffset = CGSize(width: 0, height: 3)
        tryOn.layer.shadowOpacity = 0.2
        
        customTitle.layer.shadowRadius = 2
        customTitle.layer.shadowOffset = CGSize(width: 0, height: 3)
        customTitle.layer.shadowOpacity = 0.2
    }
}
