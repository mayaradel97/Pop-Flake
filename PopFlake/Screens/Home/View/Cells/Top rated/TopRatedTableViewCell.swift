//
//  TopRatedTableViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class TopRatedTableViewCell: UITableViewCell,ItemTableViewCell, IDetailsView
{
    
    
    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    let cell = String(describing: InTheatersCollectionViewCell.self)
    var items: [Item] = []
    var homeViewModel: HomeViewModel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(items: [Item],homeViewModel: HomeViewModel)
    {
        self.homeViewModel = homeViewModel
        self.items = items
        topRatedCollectionView.reloadData()
    }
    
    func setUpCell()
    {
        topRatedCollectionView.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        topRatedCollectionView.dataSource = self
        topRatedCollectionView.delegate = self
    }
    
    func configureCell(cell: ItemCollectionViewCell, indexPath: IndexPath)
    {
        cell.configure(item: items[indexPath.row])
    }
    
}
extension TopRatedTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let topRatedCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! InTheatersCollectionViewCell
        self.configureCell(cell: topRatedCollectionViewCell, indexPath: indexPath)
        return topRatedCollectionViewCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 350)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let id = items[indexPath.row].id
        self.showDetailsSafariView(with: id)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        if indexPath.row == items.count - 1
        {
            homeViewModel.getTopRatedItems()
        }
    }
}
