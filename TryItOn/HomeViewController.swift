//
//  HomeViewController.swift
//  arDetector
//
//  Created by snoopy on 10/08/2021.
//

import UIKit
import expanding_collection

class HomeViewController: ExpandingViewController {
    
    fileprivate var cellsIsOpen = [Bool]()
    @IBOutlet weak var backgroudImage : UIImageView!
    typealias ItemInfo = (imageName: String, title: String)
    fileprivate let items: [ItemInfo] = [("nike1", "Boston"), ("nike2", "New York"), ("nike3", "San Francisco"), ("nike4", "Washington")]
    
    fileprivate func fillCellIsOpenArray() {
        cellsIsOpen = Array(repeating: false, count: items.count)
    }

    fileprivate func getViewController() -> ExpandingTableViewController {
        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
        let toViewController: sneakerDetailView = storyboard.instantiateViewController(identifier: "detial_vc")
        return toViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemSize = CGSize(width: 256, height: 460)
        
        let nib = UINib(nibName:  String(describing: HomeCollectionViewCell.self), bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: HomeCollectionViewCell.self))
    }
    
}

extension HomeViewController {

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        super.collectionView(collectionView, willDisplay: cell, forItemAt: indexPath)
        guard let cell = cell as? HomeCollectionViewCell else { return }

        let index = indexPath.row % items.count
        let info = items[index]
        cell.backgroundImageView?.image = UIImage(named: info.imageName)

//        cell.cellIsOpen(cellsIsOpen[index], animated: false)
        
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? HomeCollectionViewCell
            , currentIndex == indexPath.row else { return }

        if cell.isOpened == false {
            cell.cellIsOpen(true)
            cell.delegate = self
        } else {
            cell.cellIsOpen(false)
            pushToViewController(getViewController())
//            if let rightButton = navigationItem.rightBarButtonItem as? AnimatingBarButton {
//                rightButton.animationSelected(true)
//            }
        }
    }
}

extension HomeViewController {

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCollectionViewCell.self), for: indexPath)
    }


}

extension HomeViewController: HistoricoClienteServidorTableViewCellDelegate {

      func didButtonPressed() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "ar_vc")

        present(secondVC, animated: true, completion: nil)
      }
    
    func purchaseTapped(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "location_vc")

        present(secondVC, animated: true, completion: nil)
    }

}
