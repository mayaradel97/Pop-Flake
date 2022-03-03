//
//  ComingSoonTableViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class ComingSoonTableViewCell: UITableViewCell,ItemTableViewCell,IDetailsView
{
    func configure(items: [Item])
    {
        self.items = items
        comingSoonCollectionView.reloadData()
    }
    

    @IBOutlet weak var comingSoonCollectionView: UICollectionView!
    let cell = String(describing: ComingSoonCollectionViewCell.self)
    var items: [Item] = []
    override func awakeFromNib()
    {
        super.awakeFromNib()
      //  self.setUpCell()
       
  
       
    }
    func setUpCell()
    {
        comingSoonCollectionView.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        comingSoonCollectionView.delegate = self
        comingSoonCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(cell: ItemCollectionViewCell,indexPath: IndexPath)
    {
        cell.configure(item: items[indexPath.row])
    }
    
}
extension ComingSoonTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let comingSoonCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! ComingSoonCollectionViewCell
        self.configureCell(cell: comingSoonCollectionViewCell, indexPath: indexPath)
        return comingSoonCollectionViewCell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 350)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let id = items[indexPath.row].id
        self.showDetailsSafariView(with: id)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        30
    }
}
