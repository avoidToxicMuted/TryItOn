//
//  locationViewController.swift
//  arDetector
//
//  Created by snoopy on 10/08/2021.
//

import UIKit

class locationViewController: UIViewController {

    @IBOutlet weak var addressTableView : UITableView!
    
    let locations : [location] = [location(locatioName: "NIKE PAVILION", address: "Lot No. C5.03.00, Level 5, Pavilion KL, 168, Bukit Bintang St, 55100 Kuala Lumpur, Federal Territory of Kuala Lumpur") , location(locatioName: "NIKE MID VALLEY", address: "Mid Valley Megamall, T017, Lingkaran Syed Putra, Mid Valley City, 59200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addressTableView.delegate = self
        addressTableView.dataSource = self

    }
    

}

extension locationViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell") as! locationCell
        cell.location = locations[indexPath.row]
        print(cell.location)
        return cell
    }
    
    
}
