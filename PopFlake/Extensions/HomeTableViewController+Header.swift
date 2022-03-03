//
//  HomeTableViewController+Header.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/2/22.
//

import UIKit
//MARK: - Header creation
extension HomeViewController
{
    func configureHeaderView()
    {
        headerCollectionViewCell = String(describing: HeaderCollectionViewCell.self)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
         headerCollectionView = UICollectionView(frame:  CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300 ), collectionViewLayout: layout)
        headerCollectionView.isPagingEnabled = true
        headerCollectionView.isUserInteractionEnabled = true
        headerCollectionView.dataSource = self
        headerCollectionView.delegate = self
        headerCollectionView.register(UINib(nibName: headerCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: headerCollectionViewCell)
        headerCollectionView.showsHorizontalScrollIndicator = false
        homeTableView.tableHeaderView = headerCollectionView
        
    }

    
}
//MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource,HeaderMovement
{
    func moveToNextCell(index: Int)
    {
        headerCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return homeViewModel.itemsTrailors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: headerCollectionViewCell, for: indexPath) as! HeaderCollectionViewCell
        homeViewModel.configureHeaderCell(cell: headerCell, indexPath: indexPath)
       
        return headerCell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout
{
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
       return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
      return  0
    }
}
