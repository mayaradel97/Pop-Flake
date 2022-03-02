//
//  InTheatersTableViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class InTheatersTableViewCell: UITableViewCell,ItemTableViewCell
{
   
    let cell = String(describing: InTheatersCollectionViewCell.self)
    var items: [Item] = []

    @IBOutlet weak var inTheatersCollectionView: UICollectionView!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(items: [Item])
    {
        self.items = items
        self.inTheatersCollectionView.reloadData()
    }
    
    func setUpCell()
    {
       inTheatersCollectionView.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        inTheatersCollectionView.delegate = self
        inTheatersCollectionView.dataSource = self
    }
    func configureCell(cell: ItemCollectionViewCell, indexPath: IndexPath)
    {
        cell.configure(item: items[indexPath.row])
    }
}
extension InTheatersTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let inTheatersCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! InTheatersCollectionViewCell
        self.configureCell(cell: inTheatersCollectionViewCell, indexPath: indexPath)
        return inTheatersCollectionViewCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 350)
    }
    
}
