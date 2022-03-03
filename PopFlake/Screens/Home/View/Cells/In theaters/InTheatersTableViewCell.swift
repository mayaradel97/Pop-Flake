//
//  InTheatersTableViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class InTheatersTableViewCell: UITableViewCell,ItemTableViewCell,IDetailsView
{
    
    let cell = String(describing: InTheatersCollectionViewCell.self)
    var items: [Item] = []
    var homeViewModel: HomeViewModel!
    @IBOutlet weak var inTheatersCollectionView: UICollectionView!
    
    func configure(items: [Item],homeViewModel: HomeViewModel)
    {
        self.homeViewModel = homeViewModel
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

//MARK: - UICollectionViewDataSource
extension InTheatersTableViewCell: UICollectionViewDataSource
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
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        if indexPath.row == items.count - 1
        {
            homeViewModel.getInTheatersItems()
        }
    }
}

//MARK: - InTheatersTableViewCell
extension InTheatersTableViewCell: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let id = items[indexPath.row].id
        self.showDetailsSafariView(with: id)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension InTheatersTableViewCell: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        CGSize(width: 200, height: 350)
    }
}
