//
//  ComingSoonTableViewCell.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import UIKit

class ComingSoonTableViewCell: UITableViewCell,ItemTableViewCell
{
    @IBOutlet weak var comingSoonCollectionView: UICollectionView!
    let cell = String(describing: ComingSoonCollectionViewCell.self)
    var items: [Item] = []
    var homeViewModel: HomeViewModel!
    func setUpCell()
    {
        comingSoonCollectionView.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
        comingSoonCollectionView.delegate = self
        comingSoonCollectionView.dataSource = self
    }
    func configure(items: [Item],homeViewModel: HomeViewModel)
    {
        self.items = items
        self.homeViewModel = homeViewModel
        DispatchQueue.main.async
        {
            [weak self] in
                guard let self = self else {return}
            self.comingSoonCollectionView.reloadData()
            self.comingSoonCollectionView.scrollRectToVisible(CGRect.zero, animated: false)
        }

       
    }
    func configureCell(cell: ItemCollectionViewCell,indexPath: IndexPath)
    {
        cell.configure(item: items[indexPath.row])
    }
    
}
//MARK: - UICollectionViewDataSource
extension ComingSoonTableViewCell: UICollectionViewDataSource
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
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    {
        if indexPath.row == items.count - 1
        {
            homeViewModel.getComingSoonItems()
        }
    }
}

//MARK: - UICollectionViewDelegate
extension ComingSoonTableViewCell: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let id = items[indexPath.row].id
        self.showDetailsSafariView(with: id)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ComingSoonTableViewCell: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 200, height: 350)
    }
}
