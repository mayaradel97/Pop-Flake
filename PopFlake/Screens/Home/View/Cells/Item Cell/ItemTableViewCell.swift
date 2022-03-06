//
//  InTheatersTableViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class ItemTableViewCell: UITableViewCell,ITableViewCell
{
    
    let cell = String(describing: ItemCollectionViewCell.self)
    var items: [Item] = []
    var homeViewModel: HomeViewModel!
    var hideStarIcon: Bool!
    var itemType: String!
    @IBOutlet weak var inTheatersCollectionView: UICollectionView!
    override func awakeFromNib()
    {
        setUpCell()
    }
    func configure(items: [Item],hideStarIcon: Bool,homeViewModel: HomeViewModel,itemType: String)
    {
        self.hideStarIcon = hideStarIcon
        self.items = items
        self.homeViewModel = homeViewModel
        self.itemType = itemType
        DispatchQueue.main.async
        {
            [weak self] in
            guard let self = self else {return}
            self.inTheatersCollectionView.reloadData()
            self.inTheatersCollectionView.scrollRectToVisible(CGRect.zero, animated: false)
        }

    }
    
    func setUpCell()
    {
        inTheatersCollectionView.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        inTheatersCollectionView.delegate = self
        inTheatersCollectionView.dataSource = self
    }

}

//MARK: - UICollectionViewDataSource
extension ItemTableViewCell: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let inTheatersCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as! ItemCollectionViewCell
        inTheatersCollectionViewCell.configure(item: items[indexPath.item], hideStarIcon: self.hideStarIcon)
        return inTheatersCollectionViewCell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        if indexPath.row == items.count - 1
        {
            guard let itemType = itemType
            else{return}
            switch itemType
            {
            case "comingSonnItems":
                homeViewModel.getComingSoonItems()
            case "inTheatersItems":
                homeViewModel.getInTheatersItems()
            default:
                break
            }
        }
    }
}

//MARK: - InTheatersTableViewCell
extension ItemTableViewCell: UICollectionViewDelegate,IDetailsView
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let id = items[indexPath.row].id
        self.showDetailsSafariView(with: id)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ItemTableViewCell: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        CGSize(width: 200, height: 350)
    }
}
