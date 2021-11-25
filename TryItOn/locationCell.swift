//
//  locationCell.swift
//  arDetector
//
//  Created by snoopy on 10/08/2021.
//

import UIKit

class locationCell: UITableViewCell {

    @IBOutlet weak var locationName : UILabel!
    @IBOutlet weak var address : UILabel!
    @IBOutlet weak var navigate : UIButton!
    
    var location : location? = nil{
        didSet{
            locationName.text = location?.locatioName
            address.text = location?.address
            navigate.layer.masksToBounds = true
            navigate.layer.cornerRadius = 8.0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
