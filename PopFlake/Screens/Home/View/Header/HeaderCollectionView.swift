//
//  HeaderCollectionView.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import UIKit

class HeaderCollectionView: UITableViewHeaderFooterView
{

    @IBOutlet weak var headerCollectionView: UICollectionView!
    let cell = String(describing: HeaderCollectionViewCell.self)
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
  

}
extension HeaderCollectionView: UICollectionViewDelegate,UICollectionViewDataSource
{
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! HeaderCollectionViewCell
        headerCell.posterImageView.image = #imageLiteral(resourceName: "img1")
        headerCell.videoImageView.image = #imageLiteral(resourceName: "img2")
    
        return headerCell
    }
}
