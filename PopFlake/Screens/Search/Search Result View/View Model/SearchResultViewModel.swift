//
//  SearchResultViewModel.swift
//  PopFlake
//
//  Created by Mayar Adel on 3/3/22.
//

import Foundation
class SearchResultViewModel
{
    var bindItemsToView: (()->())!
    var items: [ItemSearch] = []
    {
        didSet
        {
            self.bindItemsToView()
        }
    }
    func configureCell(cell: SearchCellView, indexPath: IndexPath)
    {
        cell.configure(item: items[indexPath.row])
    }
    
    
}


