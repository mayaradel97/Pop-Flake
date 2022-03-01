//
//  ComingSoonTableViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class ComingSoonTableViewCell: UITableViewCell
{

    @IBOutlet weak var comingSoonCollectionView: UICollectionView!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        let cell = String(describing: ComingSoonCollectionViewCell.self)
        comingSoonCollectionView.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
//extension ComingSoonTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource
//{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
//    {
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
//    {
//
//    }
//
//
//}
