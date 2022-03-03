//
//  ItemsCellView.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import Foundation
protocol ItemTableViewCell
{
    func configure(items: [Item],homeViewModel: HomeViewModel)
    func setUpCell()
    func configureCell(cell: ItemCollectionViewCell,indexPath: IndexPath)
}
