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
    let cell = String(describing: ComingSoonCollectionViewCell.self)
    var items: [Item] = []
    override func awakeFromNib()
    {
        super.awakeFromNib()
       // self.setUpCell()
        comingSoonCollectionView.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        comingSoonCollectionView.delegate = self
        comingSoonCollectionView.dataSource = self
        
       
    }
    func setUpCell()
    {
        comingSoonCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ComingSoonTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        print(items.count)
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let comingSoonCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! ComingSoonCollectionViewCell
        comingSoonCollectionViewCell.configure(item: items[indexPath.row])
        print(items)
        return comingSoonCollectionViewCell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 350)
    }

}
