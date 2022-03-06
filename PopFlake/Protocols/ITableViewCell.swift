//
//  ItemsCellView.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/1/22.
//

import Foundation
protocol ITableViewCell
{
    func configure(items: [Item] ,homeViewModel:HomeViewModel)
    func setUpCell()
}
